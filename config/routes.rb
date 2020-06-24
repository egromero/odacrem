Rails.application.routes.draw do
  get 'my_demands/mydemand'
  get 'my_demands/myhelp'
  get 'static_pages/about'
  get '/donations/donate', to: 'donations#donate'
  post '/donations/process_donations', to: 'donations#process_donations'
  resources :allocations
  resources :products
  resources :demands
  resources :donations
  devise_for :users,  controllers: {
        sessions: 'users/sessions'
      }
  get 'landing/index'
  get '/users/:id/demands', to: 'users#show_demands'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static_pages#about'

  get '/new_request', to: 'users#request_hospital'
  post '/create_request', to: 'users#create_request'
  get '/requests', to: 'users#request_list'
  get '/accept_request', to: 'users#accept_request'

end
