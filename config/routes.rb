Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'welcome#index'


  resources :surveys do
    resources :comments
  end

  post '/tab_results' => 'surveys#tab_results'
  get '/tab_results' => 'surveys#results'
  get '/results' => 'surveys#results'

  get '/account/:id' => 'welcome#account', as: 'account'
  get '/admin' => 'admin#index'
end
