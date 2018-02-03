class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def update_sort(name)
    session[name] = {} if session[name].nil? || params['reset'].present?
    if params['sort'] != session[name]['sort']
      session[name]['sort']  = params['sort'].to_sym
      session[name]['index'] = 'asc'
      return
    end
    if session[name]['index'] == 'asc'
      session[name]['index'] = 'desc'
    else
      session[name]['index'] = 'asc'
    end
  end
end
