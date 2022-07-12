class AuthorsController < ApplicationController
  def index
    @authors = Author.most_recently_created
  end

  def show
    @author = Author.find(params[:id])
  end
end
