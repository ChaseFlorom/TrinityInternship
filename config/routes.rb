Rails.application.routes.draw do
  get 'welcome/index'
  get 'interns', to: 'user#index'
  root 'welcome#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
