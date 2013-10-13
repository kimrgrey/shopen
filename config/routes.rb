Shopen::Application.routes.draw do
  devise_for :users, skip: [:registrations], controllers: {sessions: "sessions"}
  
  devise_scope :user do
    resource :registration, only: [:new, :create], path: 'users', controller: 'devise/registrations', as: :user_registration 
  end
  
  resources :categories
  resources :products

  root 'products#index'
end
