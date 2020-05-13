Rails.application.routes.draw do
  resources :allocations
  resources :products
  resources :demands
  devise_for :users,  controllers: {
        sessions: 'users/sessions'
      }
  get 'landing/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'landing#index'
end
