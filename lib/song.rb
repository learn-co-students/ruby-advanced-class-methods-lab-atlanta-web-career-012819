require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.all
    @@all
  end

  def self.new_by_name(name)
    song = self.new
    # binding.pry
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if !song
      song = self.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    filename = filename.chomp('.mp3')
    data = filename.split(' - ')
    song = self.new
    song.artist_name = data[0]
    song.name = data[1]
    song
    # binding.pry
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
