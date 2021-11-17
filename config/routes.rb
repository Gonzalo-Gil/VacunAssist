Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :enfermedads
      resources :laboratorios
      resources :sedes
      resources :turnos
      resources :vacunas

      root to: "users#index"
    end
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'turnos/cargar', to: 'turnos#cargar', as: :turnos_cargar
  post 'turnos/crear', to: 'turnos#crear', as: :turnos_crear
  get 'turnos/pedir', to: 'turnos#pedir_turno', as: :turnos_pedir
  get 'turnos/fantasma', to: 'turnos#fantasma', as: :turnos_fantasma
  resources :turnos
  resources :vacunas
  get 'pages/home'  
  
  root 'pages#home'
  
  

  get '/perfil', to: 'users#show'
end
