class Song 
  attr_accessor :name, :artist, :genre 
  @@all = []
  def initialize(name, artist = nil, genre = nil) 
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil 
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
  def self.create(song)
    song = Song.new(song)
    song.save 
    song 
  end
  def artist
    @artist
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless genre.songs.include?(self)
  end
  
    
    
end
