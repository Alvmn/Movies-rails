class Movie < ActiveRecord::Base
  has_and_belongs_to_many :cast_members
  def self.secureFind(id)
    p = find_by_id(id)

    raise "That Id came from space" if !p
    p
  end
end
