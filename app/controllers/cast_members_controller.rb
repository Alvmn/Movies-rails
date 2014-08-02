class CastMembersController < ApplicationController
	def index
    	@actors = CastMember.order("full_name ASC")
      render 'actors'
  end
  	def show
  		@actor = CastMember.find_by_id(params[:id])
  	  @actor_movies = @actor.movies
    end
end
