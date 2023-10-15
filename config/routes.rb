Rails.application.routes.draw do
  
  root 'tops#index'
  get '/privacy', to: 'tops#privacy'
  get '/terms', to: 'tops#terms'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'log_out', to: 'sessions#destroy', as: 'log_out'
  
  resources :users, only: %i[show]
  resources :sessions, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  resources :posts do
    resource :like, only: [:create, :destroy]
    resources :comments, only: %i[new create edit update destroy], shallow: true
    collection do
      get 'search'
      get 'category/:category_id', action: :category, as: :category
    end
  end
  resources :questions, only: %i[index new create show] do
    get 'random', on: :collection, to: 'questions#random'
    resources :answers, only: %i[create]
  end
  resources :albums
end
