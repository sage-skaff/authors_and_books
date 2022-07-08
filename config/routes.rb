Rails.application.routes.draw do
  get '/authors', to: 'authors#index'
  get '/authors/:id', to: 'authors#show'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
end
