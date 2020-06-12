class Genre  
  
  extend Concerns::Findable
 
  attr_accessor :name, :songs 
   @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(genre_name)
    self.new(genre_name)
  end
  
   def add_song(song)
    if song.genre == nil 
      song.genre = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end
  
  def artists
    artists = @songs.collect{|song|song.artist}
    artists.uniq
  end
end