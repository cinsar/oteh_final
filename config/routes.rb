Rails.application.routes.draw do
  
  scope path_names: { new: 'nuevo', create: 'crear' } do

    devise_for :users, path: 'usuarios', path_names: { sign_in: 'login', sign_out: 'logout', password: 'contrasenas', confirmation: 'confirmacion' }
    devise_for :administrators, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout', password: 'contrasenas' }

    authenticated :user do
      root to: "home#usuario", as: "authenticated_root"
      
      get 'grupos/nuevo'
      post 'grupos/crear'

      get 'articulo/nuevo'
      post 'articulo/crear'
    end

    authenticated :administrators do
      namespace :admin do
        resources :grupos
      end
    end

    # Todas las rutas del registro
    
    #Formulario inicial
    get 'registro' => 'registro#index'
    post 'registro' => 'registro#index'
    
    #Formulario por tipo de registro
    get 'registro/empresa'
    get 'registro/externo'
    get 'registro/institucion_educativa'
    get 'registro/centro_investigacion'
    get 'registro/investigador'
    get 'registro/estudiante'
    
    # Creación del registro
    post 'articulo/create'
    post 'registro/crear_empresa'
    post 'registro/crear_externo'
    post 'registro/crear_institucion_educativa'
    post 'registro/crear_centro_investigacion'
    post 'registro/crear_investigador'
    post 'registro/crear_estudiante'

    # FIN de Registro =============================
   
    
    get 'direcciones/get_estados'
    get 'direcciones/get_municipios'
  end

  root to: 'home#index'
end
