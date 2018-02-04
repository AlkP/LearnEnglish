class DictionariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index]

  before_action -> { update_sort(controller_name) }, only: [:index], unless: -> { params['sort'].nil? && params['reset'].nil? }

  def index
    # reset_session
    @dictionaries = Dictionary.all.sort_by_session(session[controller_name]).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
