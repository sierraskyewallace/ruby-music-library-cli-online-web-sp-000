class Artist 
  attr_accessor :name, :song
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  def self.all 
    @@all 
  end
  def self.destroy_all 
    @@all.clear 
  end
  def save 
    @@all << self 
  end
  def self.create(artist)
    artist = self.new(artist)
    artist.save 
    artist
  end
  def songs
    @songs
  end
  def add_song(song) 
    self.songs << song unless? songs.include?(song)
    song.artist = self if song.artist.nil?
  end
      
end
