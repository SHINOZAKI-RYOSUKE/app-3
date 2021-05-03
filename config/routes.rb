Rails.application.routes.draw do
  
  root 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about'
  
  resources :users,only: [:index,:show,:edit,:update]
  
  resources :books,only: [:index,:show,:edit,:create,:update,:destroy] do
    resource :favorites,only: [:create,:destroy]
    resources :book_comments,only: [:create,:destroy]
  end
end
