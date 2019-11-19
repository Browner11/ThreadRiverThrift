Rails.application.routes.draw do
  get 'category/index'
  get 'category/show'
  resources :pages

  get '/static/:permalink', to: 'pages#permalink', as: 'permalink'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products, only: %i[index show] do
    collection do
      get 'search_results'
    end
  end



  # post 'cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  # delete 'cart/:id', to: 'products#delete_from_cart', as: 'delete_to_cart'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'products#index'
  root to: 'products#index'
end
