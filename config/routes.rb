Rails.application.routes.draw do
  get 'reservations/create'

  get 'reservations/show'

  get 'reservations/update'

  get 'reservations/destroy'

  get 'reviews/create'

  get 'reviews/show'

  get 'reviews/update'

  get 'reviews/destroy'

  get 'cars/create'

  get 'cars/show'

  get 'cars/update'

  get 'cars/destroy'

  get 'users/create'

  get 'users/show'

  get 'users/update'

  get 'users/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
