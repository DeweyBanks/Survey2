Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'welcome#index'

  resources :surveys
  post '/tab_results' => 'surveys#tab_results'
  get '/tab_results' => 'surveys#results'
  get '/results' => 'surveys#results'
  get '/account/:id' => 'welcome#account', as: 'account'

end
