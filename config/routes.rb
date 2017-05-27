Rails.application.routes.draw do
  devise_for :users
	root to: 'home#home'
	get '/home' => 'home#home'
	
end
