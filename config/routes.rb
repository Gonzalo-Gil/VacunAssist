Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'turnos/cargar', to: 'turnos#cargar', as: :turnos_cargar
  post 'turnos/crear', to: 'turnos#crear', as: :turnos_crear
  resources :turnos
  resources :vacunas

  get 'pages/home'  
  
  root 'pages#home'
  
  

  get '/perfil', to: 'users#show'
end
