class DictionariesController < ApplicationController
  require 'csv'
  before_action :authenticate_user!
  before_action :set_user, except: [:index, :upload]

  before_action -> { update_sort(controller_name) }, only: [:index], unless: -> { params['sort'].nil? && params['reset'].nil? }

  def index
    # reset_session
    @dictionaries = Dictionary.all.sort_by_session(session[controller_name]).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def upload
    CSV.foreach(params["upload_csv"].path, headers: true) do |row|
      # puts row['voice'].to_s if row['voice'].present?
      # puts row['language'].to_s + ' | ' + row['vocabulary'].to_s + ' | ' + row['category'].to_s  + ' | ' +
      #          row['word'].to_s  + ' | ' + row['translate'].to_s  + ' | ' + row['transcription'].to_s  + ' | ' +
      #          row['voice'].to_s
      word = Dictionary.where(language: row['language'].to_i).where(translate: row['translate']).take
      if word.present?
        word.update!(vocabulary: row['vocabulary'].to_i,
                     category: row['category'].to_i,
                     word: row['word'],
                     transcription: row['transcription'],
                     voice: row['voice'])
      else
        Dictionary.create!(language: row['language'].to_i,
                           vocabulary: row['vocabulary'].to_i,
                           category: row['category'].to_i,
                           word: row['word'],
                           translate: row['translate'],
                           transcription: row['transcription'],
                           voice: row['voice'])
      end
    end
  end
end
