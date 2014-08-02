class Movie < ActiveRecord::Base
  has_and_belongs_to_many :cast_members
  has_many :reviews
  
  validates :title, uniqueness: {message: "That movie is already in database"}
  validates :poster, presence: true
  validates :year, numericality: true
end