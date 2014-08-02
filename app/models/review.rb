class Review < ActiveRecord::Base
	belongs_to :movies 
	validates :email, uniqueness: true
	validates :comment, presence: true
end
