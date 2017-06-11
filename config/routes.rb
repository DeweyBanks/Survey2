Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'welcome#index'

  resources :preferences, :only => [:update]
  resources :surveys do
    resources :comments, :except => [:index, :show]
  end

  post '/tab_results' => 'surveys#tab_results'
  get '/tab_results' => 'surveys#results'
  get '/results' => 'surveys#results'


  get '/account/:id' => 'welcome#account', as: 'account'
  get '/about' => 'welcome#about', as: 'about'
  get '/admin' => 'admin#index'
  post '/comments/:id/vote/:direction' => 'comments#vote', as: 'vote'
  post '/feedback' => 'feedbacks#create', as: 'feedbacks'

  resources :users, :only => [:edit, :update]
end
