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
    song = Song.new   # instantiate new Song
    song.save         # save song inst
    song              # returns song inst
  end 

  def self.new_by_name(song_name)   # takes in string name
    song = Song.new                 # instantiate new Song
    song.name = song_name           # assign name to song_name var
    song                            # returns song inst w/name
  end 

  def self.create_by_name(song_name)  # takes in string
    song = Song.create                #returnsmodel regardless of whether obj was saved/not
    song.name = song_name             # assign/save song_name var to Song .name
    song
  end 

  def self.find_by_name(song_name)    #finds song present in @@all
    @@all.find { |song| song.name == song_name}  #iterate thru each song inst & finds one 
  end                                            # where .name == song_name

  # accepts sting name arg, returns matching song inst OR creat a new song w/the name
  def self.find_or_create_by_name(song_name) 
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end # matches song_name to song.name  #if# no, creates new song inst & assigns song_name to Song .name

  def self.alphabetical  # returns all songs in alpha order, .uniq to remove dublicates
    self.all.sort_by { |song| song.name }.uniq
  end 

  def self.new_from_filename(filename)        #(/[\s, \- .mp3]/)
    split_song = filename.split(" - ")         #(/( - |.mp3)/)  didnt work right, had to split_song[2]
    artist_name = split_song[0]             #w/gsub works
    song_name = split_song[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song 
  end

  def self.create_from_filename(filename)     
    split_song = filename.split(" - ") # 1. "Taylor Swift - Blank Space.mp3" --> ["Taylor Swift", "Blank Space.mp3"]
    artist_name = split_song[0]  #  2.     artist_name = Taylor Swift                   [0]             [1]
    song_name = split_song[1].gsub(".mp3", "") # 3. gsub, subs "el 1", for "el 2", in this case ".mp3" for "" nothing
    song = self.new             # creates new song intance        
    song.name = song_name   # assings song_name to Song class :name inst
    song.artist_name = artist_name # ^ same as above ^
    song
  end  
 
  def self.destroy_all  #deletes all inst stored in @@all
    @@all.clear       #removes all elements from self, 
  end                 # delete deletes all items from self that are equal to obj




end  