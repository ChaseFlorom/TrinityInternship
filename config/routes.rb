Rails.application.routes.draw do
  default_url_options :host => "example.com"
  get 'welcome/index'
  root 'welcome#index'
  devise_for :users
  resources :users, :only => [:index, :show]
  delete "users/:id", to: "users#destroy"
  get 'interns', to: 'users#index'
  get 'grades', to: 'grades#index'
  resources :units
  resources :assignments 
  resources :submissions
  resources :announcements
  resources :comments_submissions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
