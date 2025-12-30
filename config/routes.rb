Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

Rails.application.routes.draw do
  get "/tags", to: "tags#index"
#  get "tags/:edit" => "tags#edit", as: :edit_tag_path
  # get "tags/:id" => "tags#show"
  # get "tags/:new" => "tags#new"
#  resources :tag, path: '', only: [:show] 
 resources :tags
end

Rails.application.routes.draw do
  get "/articles", to: "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
        get "/users", to: "users#index", via: "get"
end

Rails.application.routes.draw do
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
