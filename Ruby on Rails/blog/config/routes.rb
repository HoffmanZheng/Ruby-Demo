Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  resources :microposts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # ---> define the root routes thought syntax: root 'controller_name#action_name'
  root 'users#index'
end
