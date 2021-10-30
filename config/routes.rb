Rails.application.routes.draw do
  devise_for :users
  resources :turnos

  get 'pages/home'  
  
  root 'pages#home'
  
end
