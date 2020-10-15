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
  def self.find_by_name(song)
    self.all.detect {|s| s.name == song}
  end
  def self.find_or_create_by_name(song)
    find_by_name(song) || create(song)
  end
  def self.new_from_filename(filename)
    title = filename.split(" - ")
    artist = Artist.find_or_create_by_name(title[0])
    genre = Genre.find_or_create_by_name(title[2][0..-5])
    create(title[1], artist, genre)
  end
    
    
end
