Rails.application.routes.draw do

  get '/' => 'users#index'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/mycards' => 'my_cards#index'
  get '/mycards/:id' => 'my_cards#show'

  get '/games/' => 'games#index'
  get '/games/new' => 'games#new'
  post '/games/' => 'games#create'

  get '/games/:id/attack/' => 'games#attack'
  get '/games/:id/dealdamage' => 'games#deal_damage'
  post '/games/:id/endturn' => 'games#end_turn'
  get '/games/:id/victory' => 'games#victory'

end
