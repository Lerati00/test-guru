Rails.application.routes.draw do
  devise_for :users, path: :gurus, 
                     path_names: { sign_in: :login, sign_out: :logout  },
                     controllers: { registrations: 'users/registrations' }
  root to: 'tests#index'

  get 'sessions/new'
  get 'users/new'

  resources :tests, only: :index do

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
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: %i[index]
    resources :badges
  end

  resources :gists, only: %i[create]
  resources :badges, only: %i[index]
  resources :feedbacks, only: %i[new create]

end
