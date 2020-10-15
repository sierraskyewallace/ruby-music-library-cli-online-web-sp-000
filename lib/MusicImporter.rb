class MusicImporter 
  attr_accessor :path, :song, :artist, :genre 
  def initialize(path)
    @path = path
  end
  def files 
    Dir.entries(path).select {|file| file.end_with?(".mp3")}
  end
  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
