Rails.application.routes.draw do
  get 'contact' => 'contacts#new'
  get 'contacts/create'
  get 'about' => 'about#index'

  
  namespace :admin do
    get "login" => "sessions#new", :as => "login"
    get "logou" => "sessions#destroy", :as => "logout"
    get 'sessions/create'
  end
  namespace :admin do
    get 'users/new'
    get 'users/create'
    get 'users/edit'
    get 'users/update'
    get 'users/destroy'
    get 'users/index'
    get 'users/show'
  end
  namespace :admin do
    get 'comments/destroy'
  end
  get 'comments/new'
  namespace :admin do
    get 'categories/index'
    get 'categories/show'
    get 'categories/new'
    get 'categories/create'
    get 'categories/edit'
    get 'categories/update'
    get 'categories/destroy'
  end
  get 'categories/show'
  namespace :admin do
    get 'posts/new'
    get 'posts/create'
    get 'posts/edit'
    get 'posts/update'
    get 'posts/destroy'
    get 'posts/index'
    get 'posts/show'
  end
  get 'posts/index'
  get 'posts/show'
  get 'post/index'
  get 'post/show'

  resources :posts, :categories
  resources "contacts", only: [:new, :create]

  namespace :admin do
    resources :categories, :comments, :posts, :users, :sessions
  end

  resources :posts do
    resources :comments 
  end

  root "posts#index"
  
 
end
