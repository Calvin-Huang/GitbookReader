Rails.application.routes.draw do
  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      sessions: 'users/sessions'
  }

  root 'home#index'

  resources :users do
    collection do
      get :stars, action: :stars
    end
  end
end
