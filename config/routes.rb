Rails.application.routes.draw do
  telegram_webhook(TelegramWebhooksController, bot = :default)

  root to: 'home#index'

  devise_for :users
  resources :users
  resources :dictionaries
end
