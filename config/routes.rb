Rails.application.routes.draw do


  get 'reservations/index'

  get 'reservations/show'

  root to: 'pages#home'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # As buyer
  resources :bikes, only: [:index, :show] do
    # collection do
    #   get :top # => /bikes/top
    # end
      resources :rentals, only: [:new, :create]

  end

  resources :rentals, only: [:index, :show]

  # As seller
  namespace :account do
    resources :bikes, only: [:index, :show, :new, :create, :edit, :update]
    resources :dashboards, only: [:index]
  end

  resources :reservations, only: [:index, :show] do
    member do
      patch :confirm # => /reservations/:id/cofnirm
      patch :decline
    end
  end
end
