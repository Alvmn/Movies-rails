class CreateMovieCastMembers < ActiveRecord::Migration
  def change
    create_table :cast_members_movies, id: false do |t|
      t.belongs_to :movie
      t.belongs_to :cast_member
    end
  end
end
add_column