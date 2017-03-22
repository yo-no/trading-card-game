Rails.application.routes.draw do

  # # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  # #idk if i need these resource routes but remains to be seen
  # #resources :chatrooms, param: :slug
  # #resources :messages

  get '/' => 'users#index'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/mycards' => 'my_cards#index'
  get '/mycards/:id' => 'my_cards#show'

  #for when multiple simulataneous games are supported
  #get '/games/' => 'games#index'
  get '/games/new' => 'games#new'
  post '/games/' => 'games#create'

  get '/games/:id/attack/' => 'games#attack'
  post '/games/:id/dealdamage' => 'games#deal_damage'
  post '/games/:id/endturn' => 'games#end_turn'
  get '/games/:id/victory' => 'games#victory'

  # get "/cards/" => "cards#index"
  get "/cards/new" => "cards#new"
  post "/cards" => "cards#create"
  # get "/cards/attack" => "cards#attack"
  get "cards/:id" => "cards#show"

end
