Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about',as: 'about'
  devise_for :users
  resources :books, only: [:index, :show, :create, :edit, :destroy, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :create, :edit, :update]
end
