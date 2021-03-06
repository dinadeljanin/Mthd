Rails.application.routes.draw do
  # resources :topics     # Only needed for database -+
  # =========== SNIPPETS ROUTES ===========
  resources :snippets
  post 'snippet/new', to: 'snippets#new'
  patch 'snippet/:id', to: 'snippets#update'
  # =========== CATEGORIES ROUTES ===========

  resources :categories # Not in use Yet

  # =========== USER ROUTES ===========
  resources :users, only: %i[show create edit update destroy]      # Will build up each CRUD function as we develop it over time.
  get 'user/sign_up', to: 'users#new', as: :sign_up                       # Custom URL Route to look nice
  # Handle User Login Features
  root to: redirect('user/login')                                         # https://stackoverflow.com/questions/2066504/redirect-root-url-to-somewhere-else-in-rails-application
  get 'user/login', to: 'users#login_form', as: :login                    # Handles Page Data and User Input
  get 'user/logout', to: 'users#logout'                                   # Handles Logout functionality
  post 'user/login', to: 'users#handle_login'                             # Configures data taken from User
  post 'user/logout', to: 'users#logout'                                  # Logs out user and sets logged_in_user to nil

  # Handle Edit and Delete Functions
  patch 'user/:id', to: 'users#update'                                      # Edits User Data
end
