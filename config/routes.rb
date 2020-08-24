Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  root 'tests#index'

  resources :tests , only: :index do
    member do
      post :start
    end
  end
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    root 'admin/tests#index'
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
    resources :categories
    resources :gists
  end
end
