Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get "homes/about" => 'homes#about'
  
  get '/users'=>'users#index',as: 'users_index'
  post '/users/:id/edit'=> 'users#edit',as: 'users_edit'
  
  resources :books
  resources :users
end
