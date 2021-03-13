Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  resources :users
  resources :books, except:[:new] do
    resources :favorites, only:[:create, :destroy]
    resources :comments, only:[:create, :destroy]
  end
end
