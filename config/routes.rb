Devsfornp::Application.routes.draw do
  root "pages#welcome"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :projects
  resources :users
  get 'about' => 'pages#about', as: 'about'
  get 'team'  => 'pages#team', as: 'team'
  get 'my_projects' => 'projects#my_projects', as: 'my_projects'
  get 'edit_details' => 'users#edit_details', as: 'edit_details'
  get 'projects/:id/apply'       => 'projects#apply_form',   as: 'apply'

end