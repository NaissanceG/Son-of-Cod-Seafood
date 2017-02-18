Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  root to: 'products#index'

  resources :products do
    resources :comments
  end
end
