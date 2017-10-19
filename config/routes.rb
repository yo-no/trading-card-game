Rails.application.routes.draw do

  # # Serve websocket cable requests in-process
  #mount ActionCable.server => '/cable'


  namespace :api do 

   get '/cards' => 'cards#index'
   get '/users' => 'users#index'
   get '/mycards' => 'my_cards#index'
   
  end

  get '/' => 'games#index'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/mycards' => 'my_cards#index'

  get '/games/new' => 'games#new'
  post '/games/' => 'games#create'

  get '/games/:id/attack/' => 'games#attack'
  post '/games/:id/dealdamage' => 'games#deal_damage'
  post '/games/:id/endturn' => 'games#end_turn'
  get '/games/:id/victory' => 'games#victory'
  get '/game' => 'games#game'

  resources :cards

end
