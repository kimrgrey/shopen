Shopen::Application.routes.draw do
  devise_for :users, controllers: {sessions: 'sessions', registrations: 'registrations'}
  
  namespace :admin do 
    resources :products

    root to: 'products#index'
  end

  resources :categories
  resources :products

  root to: 'products#index'
end
