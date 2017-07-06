Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }


  root to: 'home#index'

  resources :home, :only => [:index]

  resources :users, only: [:show] do
    resources :images
  end
end
