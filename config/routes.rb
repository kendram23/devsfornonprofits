Devsfornp::Application.routes.draw do
  root "pages#welcome"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :projects
  resources :users
end