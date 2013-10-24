Shopen::Application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    devise_for :users, controllers: {sessions: 'sessions', registrations: 'registrations'}
    
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
