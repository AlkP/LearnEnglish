class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  context_to_action!

  before_action :set_user, only: [ :start, :message ]

  def start(*)
    return unless check_access?
    next_word if session[:word].nil?
    respond_with :message, text: t('current_word', word: current_word)
  end

  def message(*)
    return unless check_access?
    return unless text_from_user.present?
    word = @user.day_dictionaries.find(session[:word])
    if check_word(text_from_user)
      word.successful += 1
      word.save
      respond_with :message, text: t('right')
      next_word
    else
      word.wrong += 1
      word.save
      respond_with :message, text: t('wrong')
      if attempts_over?
        respond_with :message, text: t('current_translate', word: current_translate)
        next_word
      end
    end
  end

  def restart
    next_word
  end

  private

  def set_user
    @user = User.find_by_telegram_id(telegram_id)
    return if @user.present? || phone_number.nil?
    password = get_password
    @user = User.create!(phone:       @_update['message'].try(:[], 'contact').try(:[], 'phone_number'),
                         first_name:  @_update['message'].try(:[], 'contact').try(:[], 'first_name'),
                         last_name:   @_update['message'].try(:[], 'contact').try(:[], 'last_name'),
                         telegram_id: @_update['message'].try(:[], 'contact').try(:[], 'user_id'),
                         username:    @_update['message'].try(:[], 'chat').try(:[], 'username'),
                         role: 0,
                         password:              password,
                         password_confirmation: password)
    # @user.update!(telegram_id: telegram_id, status: :active) if @user.open?
    respond_with :message,
                 text: t('your_contact', first_name: @user.first_name, phone: @user.phone, password: password),
                 reply_markup: { hide_keyboard: true }
    next_word
  end

  def get_password
    [*100000..1000000].sample.to_s
  end

  def check_access?
    if @user.nil?
      respond_with :message, text: t('not_authorized'), reply_markup: {
          'keyboard': [[{
                            text: t('send_phone'),
                            request_contact: true
                        }]]
      }
      return false
    else
      return true
    end
  end

  def current_day_world
    DayDictionary.find(session[:word])
  end

  def current_word
    current_day_world.dictionary.word
  end

  def current_translate
    current_day_world.dictionary.translate
  end

  def check_word(word)
    session[:attempts] += 1
    current_day_world.dictionary.translate.downcase == word.downcase
  end

  def next_word
    fill_daily_dictionary if DayDictionary.where(user_id: @user.id).where(date: Time.now).count == 0
    session[:attempts] = 0
    session[:word] = DayDictionary.where(user_id: @user.id).where(date: Time.now).order(successful: :asc, wrong: :asc).take.id
    respond_with :message, text: t('next_word', word: current_word)
  end

  def fill_daily_dictionary
    userArrDictionary = DayDictionary.where(user_id: @user.id)
    dailyArray = Dictionary.all.map(&:id).sort_by{ rand }
          .collect{ |id| [ id, ( 1 + userArrDictionary.where(dictionary_id: id).count ) *
                  (1 + userArrDictionary.where(dictionary_id: id).map(&:wrong).inject(0) { |sum, x| sum + x }) /
                  (1 + + userArrDictionary.where(dictionary_id: id).map(&:successful).inject(0) { |sum, x| sum + x }) ] }
          .to_h.sort_by {|_key, value| value}.to_h
          .first(@user.study).to_h.keys

    respond_with :message, text: 'Твой словарь на сегодня'
    dailyArray.each do |id|
      dd = DayDictionary.create!(user_id: @user.id, dictionary_id: id,  date: Time.now)
      respond_with :message, text: "#{dd.dictionary.word} - #{dd.dictionary.translate}"
    end
    respond_with :message, text: 'Итак начнем...'
  end

  def attempts_over?
    session[:attempts] > 1
  end

  # telegram data

  def text_from_user
    @_update['message'].try(:[], 'text')
  end

  def telegram_id
    if action_name == 'callback_query'
      @_update['callback_query']['from']['id']
    else
      @_update['message']['from']['id']
    end
  end

  def phone_number
    @_update['message'].try(:[], 'contact').try(:[], 'phone_number')
  end
end