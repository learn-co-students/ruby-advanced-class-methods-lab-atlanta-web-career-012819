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
  	@@all << song
  	song
  end

  def self.new_by_name(name)
  	song = self.new
  	song.name = name
  	song
  end

  def self.create_by_name(name)
  	song = new_by_name(name)
  	@@all << song
  	song
  end

  def self.find_by_name(name)
  	@@all.each do |song| 
  		return song if song.name == name
  	end
  	nil
  end

  def self.find_or_create_by_name(name)
  	find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
  	@@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
  	filename_array = filename.split(/[-.]/)
  	song = new_by_name(filename_array[1].strip)
  	song.artist_name = filename_array[0].strip
  	song
  end

  def self.create_from_filename(filename)
  	song = new_from_filename(filename)
  	@@all << song
  	song
  end

  def self.destroy_all
  	@@all = []
  end

end
