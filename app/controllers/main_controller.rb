class MainController < ApplicationController
  def index
  end
  def movies
    @movies = Movie.where(id: 0..10)
  end
  def show
    begin
    @movies = [Movie.secureFind(params[:id])]
    rescue Exception
      return "There is no film whit that id."
    end
    render 'movies'
  end
end
