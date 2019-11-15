class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize 
    @name = name
    @artist_name = artist_name
    @@all << self
  end 

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
    song = Song.new
    song.name = song_name
    song
  end 

  def self.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end 

  def self.find_by_name(song_name)
    @@all.find { |song| song.name == song_name}
  end 

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 

  def self.alphabetical
    self.all.sort_by { |song| song.name }.uniq
  end 

  def self.new_from_filename(filename)
    split_song = filename.split(/( - |.mp3)/)  #(/[\s, \- .mp3]/)
    artist_name = split_song[0]
    song_name = split_song[2]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    split_song = filename.split(" - ")
    artist_name = split_song[0]
    song_name = split_song[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end  
 
  def self.destroy_all
    @@all.clear
  end 




end  