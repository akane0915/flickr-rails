Rails.application.routes.draw do
  devise_for :users, skip: :registrations
  devise_scope :user do
    resource :registration,
      only: [:new, :create, :edit, :update],
      path: 'users',
      path_names: { new: 'sign_up' },
      controller: 'devise/registrations',
      as: :user_registration do
        get :cancel
      end
  end

  root to: 'home#index'

  resources :home, :only => [:index]

  resources :users, only: [:show, :index, :destroy] do
    resources :images
  end
end
