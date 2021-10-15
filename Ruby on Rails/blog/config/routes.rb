Rails.application.routes.draw do
  # get 'static_pages/home' # ---> maped to the home action
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about' # --->  automatically creates a helper `static_pages_about_url`
  get '/contact', to: 'static_pages#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # ---> define the root routes thought syntax: root 'controller_name#action_name'
  root 'static_pages#home'
  # ---> lead to the creation of Rails helper called `root_url`
  # get '/articles', to: "articles#index"
  # get '/articles/:id', to: "articles#show"
  resources :articles do
    resources :comments
  end
  # ---> Rails provides a routes method named `resources`
  # that maps all of the conventional routes for a collection of resources
  # ---> create `comments` as a nested resources within `articles`

  get '/signup', to: 'users#new'
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :microposts, only: [:create, :destroy]
end
