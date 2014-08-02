class CastMember < ActiveRecord::Base
  has_and_belongs_to_many :movies
  validates :full_name, uniqueness: {message: "That actor is already in database"}
end
