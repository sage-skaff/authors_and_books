class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:id])
    @books = @author.books
  end

  def new
    @author = Author.find(params[:id])
    @books = @author.books
  end

  def create
    author = Author.find(params[:id])
    book = author.books.create(title: params[:title],
                               pages: params[:pages],
                               series: params[:series])
    redirect_to "/authors/#{author.id}/books"
  end
end
