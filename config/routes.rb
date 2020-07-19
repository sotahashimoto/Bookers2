Rails.application.routes.draw do
  get 'top' => 'homes#top'
  get 'home/about' => 'homes#about'
  # ログイン後表示ページを設定
  root 'homes#top'
  devise_for :users
  resources :books
  resources :users, only: [:index, :edit, :update, :show]
end