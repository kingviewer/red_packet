Rails.application.routes.draw do
  # root 'dashboard#index'

  get ':controller/:action'
  post ':controller/:action'
end
