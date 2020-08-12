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
    song = self.new
    song.save
    return song
  end

  def self.new_by_name  (var)
    song = self.new
    song.name = var
    return song
  end
      
  def self.create_by_name (var)
    song = self.create
    song.name = var
    return song
  end

  def self.find_by_name (song_name)
    self.all.find {|song| song.name == "#{song_name}"}
  end

  def self.find_or_create_by_name (song)
    self.find_by_name(song) || self.create_by_name(song)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

    def self.destroy_all
      @@all = []
    end

    def self.new_from_filename (mp3)
    track  = mp3.split(/[-.]+/)
    song_new = self.create_by_name(track[1].strip)
    song_new.artist_name = track[0].strip
    song_new
    end

    def self.create_from_filename (mp3)
      track  = mp3.split(/[-.]+/)
      song_new = self.create_by_name(track[1].strip)
      song_new.artist_name = track[0].strip
      song_new
    end

    
end

