Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/user', to:'users#show'
      post '/users', to: 'users#create'
    end
  end
end
