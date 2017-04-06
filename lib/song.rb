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
      @@all << song
      return song
  end

  def self.new_by_name(name)
      song = Song.new
      song.name = name
      song
  end

  def self.create_by_name(name)
      song = Song.new
      song.name = name
      song.save
      song
  end

def self.find_by_name(name)
    @@all.each do |x|
        if x.name == name
            return x
        end
    end
end


def self.find_or_create_by_name(name)
    if Song.all.include?(name)
        Song.find_by_name(name)
    else
        Song.create_by_name(name)
    end
end


def self.alphabetical
    sorted = []
    Song.all.each do |x|
        sorted = Song.all.sort_by {|x| x.name}
    end
    sorted
end

def self.new_from_filename(name)
    song = Song.new
    song.artist_name = name.split(/[-.]/)[0][0..-2]
    song.name = name.split(/[-.]/)[1][1..-1]
    song
end

def self.create_from_filename(name)
    song = Song.new
    song.artist_name = name.split(/[-.]/)[0][0..-2]
    song.name = name.split(/[-.]/)[1][1..-1]
    song.save
end

def self.destroy_all
    @@all = []
    @@all
end

end
