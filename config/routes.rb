Rails.application.routes.draw do
  devise_for :users, controllers: {
    
    registrations: "users/registrations"
  }

  root 'homes#top'
  get 'home/about' => 'homes#about'

  get "user/followings_index" => "users#followings_index"
  get "user/followers_index" => "users#followers_index"


  resources :users,only: [:index,:show,:edit,:update] do
    resource :relationships,only: [:create,:destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :books,only: [:index,:show,:edit,:create,:update,:destroy] do
    resource :favorites,only: [:create,:destroy]
    resources :book_comments,only: [:create,:destroy]
  end

  get "search" => "searches#search_result", as: "search_result"
  
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]

end
