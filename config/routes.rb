# frozen_string_literal: true
Rails.application.routes.draw do

  resources :journals do
    resources :entries do
      put :favorite, on: :member, action: :favorite
      delete :favorite, on: :member, action: :unfavorite
    end
  end
  get '/' => 'home#index', as: :root
  get 'search' => 'search#index', as: :search
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
