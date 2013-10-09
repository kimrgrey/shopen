Shopen::Application.routes.draw do
  resources :categories
  resources :products

  root 'products#index'
end
