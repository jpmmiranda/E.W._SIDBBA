Rails.application.routes.draw do
	#root to: 'gif#cool'
	root 'sessions#home'
	get '/home' => 'sessions#home'
	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	get '/logout' => 'sessions#destroy'
	get '/signup' => 'users#new'
	post '/signup' => 'users#create'
	get '/login_home'=> 'login_home#home'
	
end
