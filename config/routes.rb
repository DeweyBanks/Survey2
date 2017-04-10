Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'welcome#index'


  resources :surveys do
    resources :comments, :except => [:index, :show]
  end

  post '/tab_results' => 'surveys#tab_results'
  get '/tab_results' => 'surveys#results'
  get '/results' => 'surveys#results'

  get '/account/:id' => 'welcome#account', as: 'account'
  get '/admin' => 'admin#index'
  post 'vote' => 'comments#vote'
  post 'comments/:id/upvote' => "comments#upvote", as: 'upvote'
  post 'comments/:id/downvote' => "comments#downvote", as: 'downvote'
end
