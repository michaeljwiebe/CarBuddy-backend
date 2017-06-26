Rails.application.routes.draw do
    resources :reservations
    resources :reviews
    resources :cars
    resources :users
    post '/sign_in', to: 'users#sign_in'
    post '/users/upload_image', to: 'users#upload_image'
    post '/users/update_image/:id', to: 'users#update_image'
    post '/cars/image', to: 'cars#upload_image'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
