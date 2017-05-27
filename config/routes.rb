Rails.application.routes.draw do
	root to: 'sessions#home'
	get '/home' => 'sessions#home'
	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	get '/logout' => 'sessions#destroy'
	resources :users
	get '/signup' => 'users#new'
	post '/signup' => 'users#create'
	
end
