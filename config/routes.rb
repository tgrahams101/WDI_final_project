Rails.application.routes.draw do
  get 'courses/index'

  get 'home/index'

  root to: 'courses#index'

  get 'yoga', to: 'home#yoga'

  get 'giphy', to: 'home#giphy'

  get 'vine', to: 'home#vine'

  post 'vine', to: 'home#tweet', as: 'tweet'

  get 'tweets', to: 'home#get_tweets', as: 'tweets'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
