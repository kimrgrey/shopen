Shopen::Application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    devise_for :users, :skip => [:registrations]
    devise_scope :user do
      resource :registration, only: [:new, :create], path: 'users', controller: 'devise/registrations', as: :user_registration
    end
    
    namespace :admin do 
      resources :products
      root to: 'products#index'
    end
    resource :user
    resources :categories
    resources :products, only: [:index, :show]
    get '/:locale' => 'products#index'
  end

  root to: 'products#index'
end
