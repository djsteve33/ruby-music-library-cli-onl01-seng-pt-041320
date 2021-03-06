require "pry"

class Song 
  
  attr_accessor :name, :artist, :genre, :musicimporter, :musiclibrarycontroller
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
    end
   
  def artist
    @artist
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
   def genre
    @genre
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def self.find_by_name(name)
    @@all.find{|song|song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    info = filename.split(" - ")
    artist_name, song_name, genre_name = info.first, info[1], info[2].gsub(".mp3", "")
   
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end
  
   
  def self.create_from_filename(filename)
       self.new_from_filename(filename).tap{|s|s.save}
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(song)
    song = self.new(song)
    song.save
    song
  end
  
  #def self.create(name)
   # self.new(name)
  #end
end