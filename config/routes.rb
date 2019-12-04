Rails.application.routes.draw do
  resources :users
  resources :cellars
  resources :reviews
  resources :stashes
  resources :bottles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "application#login", as: "app_login"

  post '/users/login', to: "users#login", as: "user_login"
  get  'app/home', to: 'application#home', as: 'app_home'
  get 'cellars/:id/stash', to: 'stashes#new', as: 'add_to_cellar'
  get 'cellars/:id/remove', to: 'stashes#remove', as: 'remove_from_cellar'
  post 'bottles/search', to: 'bottles#search', as: 'search_bottles'
  post 'bottles/linker', to: 'bottles#linker', as: 'bottle_linker'
end
