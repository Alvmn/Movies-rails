class MainController < ApplicationController
  def index
  end
  def movies
    @movies = Movie.order("created_at DESC").limit(10)
  end
  def show
    begin
    @movies = Movie.find params[:id]
    rescue Exception
      return "There is no film with that id."
    end
  end
end
