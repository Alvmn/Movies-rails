class MoviesController < ApplicationController
  def index
    @movies = Movie.order("created_at DESC").limit(15)
  end
  def show
    begin
    @movies = Movie.find params[:id] #En realidad solo es una movie
    rescue Exception
      return "There is no film with that id."
    end
  end
  def edit
      @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
     if @movie.update entry_params
      redirect_to action: 'index', controller: 'movies'
     else
      render 'edit'
     end
  end
  def new
    @movie = Movie.new
  end
  def create
    @movie = Movie.new entry_params
    if @movie.save
      redirect_to action: 'index', controller: 'movies'
      flash[:notice] = "Your movie has been added succesfully"
    else
      render 'new'
    end
  end

  def destroy
    @movie = Movie.find params[:id]
    if @movie.destroy
      redirect_to action: 'index', controller: 'movies'
    else
      return "show"
    end

  end
  private
  def entry_params
    params.require(:movie).permit(:poster, :year, :title, :description)
  end

end
