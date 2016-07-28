# frozen_string_literal: true
Rails.application.routes.draw do
  get 'settings' => 'settings#index', as: :settings
  put 'settings' => 'settings#update', as: :update_settings
  health_check_routes('status')

  resources :journals do
    resources :entries do
      put :favorite, on: :member, action: :favorite
      delete :favorite, on: :member, action: :unfavorite
    end
  end
  get '/' => 'home#index', as: :root
  get 'search' => 'search#index', as: :search
  get 'users/:id/finish_signup' => 'users#finish_signup', as: :finish_signup
  patch 'users/:id/finish_signup' => 'users#finish_signup', as: :end_finish_signup
  devise_for :users, controllers: { registrations: 'registrations',
                                    omniauth_callbacks: 'omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
