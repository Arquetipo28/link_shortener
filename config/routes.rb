Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'test', action: :test, controller: :test

  post '/links', action: :create, controller: :links
  get '/top', action: :top, controller: :links
  put '/update_count', action: :update_count, controller: :links
end
