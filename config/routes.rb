Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  devise_for :users
  resources :users, :only => [:index, :show]
  get 'interns', to: 'users#index'
  resources :units
  resources :assignments

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
