Rails.application.routes.draw do
  devise_for :users
  resources :turnos
  resources :vacunas

  get 'pages/home'  
  
  root 'pages#home'
  
  get '/perfil', to: 'users#show'
end
