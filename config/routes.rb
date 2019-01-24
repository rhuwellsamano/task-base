Rails.application.routes.draw do
  root to: 'pages#home'
  resources :tasks
  resources :user_projects
  resources :comments
  resources :projects
  devise_for :users,
      path: '',
    path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  resources :users, only: [:show]

  get '/pages/about', to: 'pages#about', as: 'about'

end
