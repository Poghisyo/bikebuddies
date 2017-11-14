Rails.application.routes.draw do
  get 'bikes/index'

  root to: 'pages#home'

  devise_for :users

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
  end

  resources :reservations, only: [:index, :show] do
    member do
      patch :confirm # => /reservations/:id/cofnirm
      patch :decline
    end
  end
end
