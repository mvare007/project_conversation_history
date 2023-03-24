Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"

  resources :projects, only: %i[index update destroy] do
    member do
      get :conversation_history
    end
    collection do
      get :comments_field
    end
  end
end
