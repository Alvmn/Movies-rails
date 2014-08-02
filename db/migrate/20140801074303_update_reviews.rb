class UpdateReviews < ActiveRecord::Migration
  def change
  	add_column(:reviews, :email, :string)
  	add_column(:reviews, :comment, :text)
  end
end
