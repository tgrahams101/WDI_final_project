Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'

  get 'users/new', to: 'users#new', as: 'new_user'

  post 'users', to: 'users#create'

  post 'signup', to: 'users#create'

  get 'users/:id', to: 'users#show', as: 'user'

  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'

  patch 'users/:id', to: 'users#update'

  get 'sessions/new', to: 'sessions#new', as: 'login'

  post 'sessions/new', to: 'sessions#create', as: 'new_session'

  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'


  get 'courses/index'

  get 'home/index'

  root to: 'home#index'

  get 'yoga', to: 'home#yoga'

  get 'giphy', to: 'home#giphy'

  get 'vine', to: 'home#vine'

  post 'vine', to: 'home#tweet', as: 'tweet'

  get 'tweets', to: 'home#get_tweets', as: 'tweets'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
