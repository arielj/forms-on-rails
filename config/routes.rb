Rails.application.routes.draw do
  resources :posts
  resources :tasks, only: [:index, :create, :update, :destroy] do
    collection do
      post :bulk_operation, action: :bulk_update
      delete :bulk_operation, action: :bulk_delete
    end
  end
  resources :addresses
  resources :appointments
  resources :pets
  resources :users do
    collection do
      get :new_dynamic
      post :new_dynamic, action: :create_dynamic
    end
    member do
      get :edit_dynamic
      patch :update_dynamic
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#home"
end
