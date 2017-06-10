Rails.application.routes.draw do

  namespace :api, defaults:{ format: :json }do
    namespace :v1 do
      resources :registos, :only =>[:create]
      resources :locais, :only => [:create]
    end
  end
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
