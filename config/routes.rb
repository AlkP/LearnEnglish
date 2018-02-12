Rails.application.routes.draw do
  telegram_webhook(TelegramWebhooksController, bot = :default)

  root to: 'home#index'

  devise_for :users
  resources :users
  resources :dictionaries

  post '/upload_csv', to: 'dictionaries#upload'
end
