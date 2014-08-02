class ReviewsController < ApplicationController
	def index
		@movie = Movie.find params[:movie_id]
		@reviews_not_ordered = @movie.reviews
		@reviews = @reviews_not_ordered.order("created_at DESC")
	end
	def new
		@movie = Movie.find params[:movie_id]
		@review =@movie.reviews.new
	end
	def create
		@movie = Movie.find params[:movie_id]
		@review = @movie.reviews.new entry_params

		if @review.save
			redirect_to action: 'index', controller: 'reviews', movie_id: @movie.id
		else
			render 'new'
		end
	end
	def show
		@movie = Movie.find params[:movie_id]
		@review = @movie.reviews.find params[:id]
	end

	def destroy
    @movie = Movie.find params[:movie_id]
	@review = @movie.reviews.find params[:id]
	    if @review.destroy
	      redirect_to action: 'index', controller: 'reviews'
	    else
	      return "show"
	    end
	end
		private 

	def entry_params
		params.require(:review).permit(:email, :comment)
	end
end
