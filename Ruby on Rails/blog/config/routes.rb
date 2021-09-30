Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # ---> define the root routes thought syntax: root 'controller_name#action_name'
  root 'application#hello'
end
