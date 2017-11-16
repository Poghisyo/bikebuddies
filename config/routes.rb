Rails.application.routes.draw do


  root to: 'pages#home'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # As buyer
  resources :bikes, only: [:index, :show] do
    # collection do
    #   get :top # => /bikes/top
    # end
    member do
      resources :rentals, only: [:new, :create]
    end
  end

  resources :rentals, only: [:index, :show]

  # As seller
  namespace :account do
    resources :bikes, only: [:index, :show, :new, :create, :edit, :update]
  end

  resources :reservations, only: [:index, :show] do
    member do
      patch :confirm # => /reservations/:id/cofnirm
      patch :decline
    end
  end
end
