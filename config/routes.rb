Rails.application.routes.draw do
  root 'tests#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'
  
  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, exept: :index do
      resources :answers, shallow: true, exept: :index
    end
    member do
      post :start
    end
  end
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
