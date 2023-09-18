Rails.application.routes.draw do
  get 'questions/new'
  get 'questions/create'
  get 'questions/edit'
  get 'users/show'
  get 'categories/new'
  get 'categories/create'
  get 'categories/index'
  get 'categories/destroy'
  get 'categories/edit'
  get 'posts/new'
  get 'posts/create'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/destroy'
  get 'tops/index'
  root 'tops#index'
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'log_out', to: 'sessions#destroy', as: 'log_out'
  
  resources :users, only: %i[show]
  resources :sessions, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  resources :posts do
    resource :like, only: [:create, :destroy]
    resources :comments, only: %i[create edit update destroy], shallow: true
    collection do
      get 'search'
      get 'category/:category_id', action: :category, as: :category
    end
  end
  resources :questions
  resources :comments
  resources :posts
end
