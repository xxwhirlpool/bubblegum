Rails.application.routes.draw do
  get 'tags/index'
  get 'tags/create'
  resources :galleries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

Rails.application.routes.draw do
  get 'tags/index'
  get 'tags/create'
  get "/tags", to: "tags#index"
  get "tags/:id" => "tags#show", as: :tag

  resources :galleries
  get "/articles", to: "articles#index"
#  get 'tags/:tag', to: 'articles#index', as: "tag"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :galleries
        get "/users", to: "users#index", via: "get"
end

Rails.application.routes.draw do
  resources :galleries
  root "articles#index"
  
  resources :profiles
  resources :articles do
    resources :comments
  end
  
  Rails.application.routes.draw do
  resources :galleries
      devise_for :users, controllers: { registrations: "users/registrations" }
      get "users/:id" => "users#show", as: :user
      
      resources :profiles
    end
end
