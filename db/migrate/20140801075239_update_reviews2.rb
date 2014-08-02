class UpdateReviews2 < ActiveRecord::Migration
  def change
  	add_column(:reviews, :movie_id, :integer)
  end
end
