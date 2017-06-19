Rails.application.routes.draw do

  namespace :api, defaults:{ format: :json }do
    namespace :v1 do
      resources :registos, :only =>[:show,:create]
      resources :locais, :only => [:create]
    end
  end
  
  post 'alertas/index' => "alertas#create"
  
  get 'locais/index'

  get 'historico/index'

  get 'user/index'

  get 'alertas/index'

  get 'inicial/index'

  get 'historico/historicoTemperatura' => 'historico#historicoTemperatura'
  get 'historico/historicoRuido' => 'historico#historicoRuido'
  get 'historico/historicoHumidade' => 'historico#historicoHumidade'


  devise_for :users, :controllers => { registrations: 'registrations' }

	root to: 'home#home'
	get '/home' => 'home#home'
	
end
