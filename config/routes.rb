Rails.application.routes.draw do
  # resources :topics     # Only needed for database Relationships
  resources :snippets     #
  resources :categories   #
  resources :users        #
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
