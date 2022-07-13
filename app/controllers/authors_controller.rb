class AuthorsController < ApplicationController
  def index
    @authors = Author.most_recently_created
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    author = Author.create(name: params[:name],
                           age: params[:age],
                           living: params[:living])
    redirect_to '/authors'
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    author.update(name: params[:name],
                  age: params[:age],
                  living: params[:living])
    redirect_to "/authors/#{author.id}"
  end

  def destroy
    author = Author.find(params[:id])
    author.destroy
    redirect_to '/authors'
  end
  # def author_params
  #   params.require(:author).permit(:name, :age, :living)
  # end
end
