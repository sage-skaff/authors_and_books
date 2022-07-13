Rails.application.routes.draw do
  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  post '/authors', to: 'authors#create'
  get '/authors/:id', to: 'authors#show'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'

  get '/authors/:id/books', to: 'author_books#index'
end
