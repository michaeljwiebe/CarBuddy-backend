Rails.application.routes.draw do
    resources :reservations
    resources :reviews
    resources :cars
    resources :users
    post '/sign_in', to: 'users#sign_in'
    post '/users/image', to: 'users#upload_image'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
