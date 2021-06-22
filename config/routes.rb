Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users 
  root 'sessions#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  # get 'logout' => 'sessions#destroy'
  get "/auth/google_oauth2/callback", to: 'sessions#google'

get "sessions/destroy"

controller :sessions do
# get  'login' => :new
# post 'login' => :create
delete 'logout' => :destroy
end
end
