Rails.application.routes.draw do
  root 'palind#input'
  get 'session/new'
  
  get 'palind/input'

  get 'palind/view', to: 'palind#view'

  get 'signup',  to: 'users#new'
  post 'create_user', to: 'users#create'
  get 'user', to: 'users#show'
  post 'user', to: 'users#update'
  get 'user_edit', to: 'users#edit'
  get 'users', to: 'users#index'
  get 'destroy_user', to: 'users#destroy'

  get 'signin',  to: 'session#new'
  get 'signout', to: 'session#destroy'
  post 'session', to: 'session#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
