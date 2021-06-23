Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/users" => "users#create"
  get "/users" => "users#index"
  patch "/users/:id" => "users#update"
  get "/users/:id" => "users#show"
end
