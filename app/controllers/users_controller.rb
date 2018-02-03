class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index]

  before_action -> { update_sort(controller_name) }, only: [:index], unless: -> { params['sort'].nil? && params['reset'].nil? }

  def index
    # reset_session
    @users = User.all.sort_by_session(session[controller_name]).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    if @user.open?
      @user.status = :closed
    else
      @user.status = :open
    end
    @user.save
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
