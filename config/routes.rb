Rails.application.routes.draw do
  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  post '/authors', to: 'authors#create'
  get '/authors/:id/edit', to: 'authors#edit'
  patch '/authors/:id', to: 'authors#update'
  get '/authors/:id', to: 'authors#show'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'

  get '/authors/:id/books', to: 'author_books#index'
  get '/authors/:id/books/new', to: 'author_books#new'
  post '/authors/:id/books', to: 'author_books#create'
end
