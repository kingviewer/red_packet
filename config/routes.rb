Rails.application.routes.draw do
  # root 'dashboard#index'

  get ':controller/:action'
  post ':controller/:action'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
