Rails.application.routes.draw do
  get 'about/page'
  get 'about/author'
  root 'toppages#index'
  get 'toppages/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :blogs
end
