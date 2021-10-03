Rails.application.routes.draw do
  get 'static_pages/home' # ---> maped to the home action
  get 'static_pages/help'
  get 'static_pages/about' # --->  automatically creates a helper `static_pages_about_url`
  resources :microposts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # ---> define the root routes thought syntax: root 'controller_name#action_name'
  root 'users#index'
end
