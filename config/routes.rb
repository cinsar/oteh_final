Rails.application.routes.draw do
  
  devise_for :administrators
  devise_for :users


  authenticated :user do
    # root :to => "main#dashboard", :as => "authenticated_root"
    get 'grupos/new'
    post 'grupos/create'
  end


  authenticated :administrators do
    # root :to => "main#dashboard", :as => "authenticated_root"
    namespace :admin do
      resources :grupos
    end
  end





  
  get 'registro/index'
  get 'registro/empresa'
  get 'registro/externo'
  get 'registro/institucion_educativa'
  get 'registro/centro_investigacion'
  get 'registro/investigador'
  get 'registro/estudiante'
 
  
  post 'registro/index'
  post 'registro/create_empresa'
  post 'registro/create_externo'
  post 'registro/create_institucion_educativa'
  post 'registro/create_centro_investigacion'
  post 'registro/create_investigador'
  post 'registro/create_estudiante'
 
  

  get 'direcciones/get_estados'

  get 'direcciones/get_municipios'

  get 'empresas1/new'

  get 'empresas1/create'

  get 'empresas/new'

  post 'empresas/create'
end
