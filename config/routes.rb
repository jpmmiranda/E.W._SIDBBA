Rails.application.routes.draw do
  get 'user/index'

  get 'alertas/index'

  get 'inicial/index'

  get 'distritos/index'

  devise_for :users
  
	root to: 'home#home'
	get '/home' => 'home#home'
	
end
