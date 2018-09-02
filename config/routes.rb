Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root 'devise/sessions#new'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    get '/' => 'home#index'
    resources :stores do
      resources :goals do
        resources :days
      end
    end
    resources :vendors
  end
end
