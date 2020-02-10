Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  devise_for :users
  resources :users, :only => [:index, :show]
  get 'interns', to: 'users#index'
  get 'grades', to: 'grades#index'
  resources :units
  resources :assignments 
  resources :submissions
  resources :announcements

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
