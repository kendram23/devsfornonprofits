Devsfornp::Application.routes.draw do
  root "pages#welcome"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :projects
  resources :users
  get 'about' => 'pages#about', as: 'about'
  get 'team'  => 'pages#team', as: 'team'
end