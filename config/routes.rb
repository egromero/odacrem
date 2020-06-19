Rails.application.routes.draw do
  get 'static_pages/about'
  resources :allocations
  resources :products
  resources :demands
  devise_for :users,  controllers: {
        sessions: 'users/sessions'
      }
  get 'landing/index'

  get '/users/:id/demands', to: 'users#show_demands'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'landing#index'
end
