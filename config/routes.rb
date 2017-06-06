Rails.application.routes.draw do
  get 'locais/index'

  get 'historico/index'

  get 'user/index'

  get 'alertas/index'

  get 'inicial/index'

  get 'distritos/index'

  devise_for :users, :controllers => { registrations: 'registrations' }

	root to: 'home#home'
	get '/home' => 'home#home'
	
end
