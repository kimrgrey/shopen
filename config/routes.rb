Shopen::Application.routes.draw do
  devise_for :users, controllers: {sessions: 'sessions', registrations: 'registrations'}
  
  resources :categories
  resources :products

  root 'products#index'
end
