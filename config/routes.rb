Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :enfermedads
      resources :laboratorios
      resources :sedes
      resources :turnos
      resources :vacunas
      resources :esquemas
      resources :doses
      root to: "users#index"
    end
    resources :reportes
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'turnos/cargar', to: 'turnos#cargar', as: :turnos_cargar
  post 'turnos/crear', to: 'turnos#crear', as: :turnos_crear
  get 'turnos/pedir', to: 'turnos#pedir_turno', as: :turnos_pedir
  get 'turnos/fantasma', to: 'turnos#fantasma', as: :turnos_fantasma
  get 'notificaciones/enviar', to: 'notificaciones#enviarNotificaciones', as: :notificaciones_enviar
  get 'comprobante/enviar', to: 'notificaciones#comprobanteTurno', as: :comprobante_enviar
  resources :turnos
  resources :vacunas
  post 'turnos/filtrar', to: 'turnos#filter', as: :turnos_filtrar
  get 'pages/home'  
  
  root 'pages#home'
  
  get '/perfil', to: 'users#show'
  get '/reportes/index', to: 'reportes#index'
  get '/reportes/create', to: 'reportes#create'
end
