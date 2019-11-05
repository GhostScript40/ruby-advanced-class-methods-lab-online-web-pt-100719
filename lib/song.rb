require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = Song.new
    song.save
    song
  end
  
  def self.new_by_name(song_name)
  song = self.create
  song.name = song_name
  @song_name = song_name
  song
  end
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    @song_name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    Song.all.find{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    song = song_name
    @song = song
   if self.find_by_name(song) == nil || false
        self.create_by_name(song)
   else
      self.find_by_name(song)
   end
  end
  
  def self.alphabetical
    Song.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(song_file)
    artist = song_file.split("-")
    self.artist_name = artist[0]
    song = artist[1].split(".")
    self.name = song[0]
    binding.pry
  end
end
