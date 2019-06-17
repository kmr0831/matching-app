Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: 'users/registrations'
  }
  root "static_pages#index"
  resources :static_pages, only: [:index, :show]
  resources :users do
    member do
      get :following, :followers, :matchers
    end
  end
  resources :relationships, only: [:create, :destroy]
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
