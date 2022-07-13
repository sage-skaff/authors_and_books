class BooksController < ApplicationController
  def index
    @books = Book.all_series.alphabetize
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(title: params[:title],
                pages: params[:pages],
                series: params[:series])
    redirect_to "/books/#{book.id}"
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
end
