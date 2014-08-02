# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

class ImdbRetriever
  attr_accessor :adapter
  def initialize(text, adapter=AdapterImdb)
    @adapter = adapter.new(text)
  end
  def nine_movies
    @adapter.movies.select{ |movie| movie.poster != nil }.take(9)
  end
  def movies(size)
    @adapter.movies.select{ |movie| movie.poster != nil }.take(size)
  end
end


class AdapterImdb
  def initialize(text)
    @search = Imdb::Search.new(text)
  end
  def movies
    @search.movies
  end
end

class AdapterImdbFake
  def initialize(text)
    @search = double("IMDB")
  end
  def stub(name, returns)
    @search.stub(name).and_return(returns)
  end
  def movies
    @search.movies
  end
end


puts "Starting Seed."
movies = ImdbRetriever.new("Harry Potter").movies(20)
puts "Allá va."
puts "\n Movies:"
movies.each do |movie|
  puts movie.title
  dbMovie = Movie.create(title: movie.title, year: movie.year, description: movie.plot, poster: movie.poster)
  movie.cast_members.each do |name|
    dbMember = CastMember.find_or_create_by(full_name: name)
    dbMovie.cast_members << dbMember
  end
end