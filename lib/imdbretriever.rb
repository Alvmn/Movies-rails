require "imdb"
class ImdbRetriever
  attr_accessor :adapter
  def initialize(text, adapter=AdapterImdb)
    @adapter = adapter.new(text)
  end
  def nine_movies
    @adapter.movies.select{ |movie| movie.poster != nil }.take(9)
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