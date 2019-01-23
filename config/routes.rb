Rails.application.routes.draw do
  resources :tasks
  resources :user_projects
  resources :comments
  resources :projects
  devise_for :users
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/pages/about', to: 'pages#about', as: 'about'

  root to: 'pages#home'
end
