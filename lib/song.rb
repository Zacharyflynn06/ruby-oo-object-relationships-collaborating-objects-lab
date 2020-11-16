require 'pry'
class Song

    @@all = []

    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        singer = file.split(" - ")[0]
        song_title = file.split(" - ")[1]
        song = Song.new(song_title)
        song.artist_name = singer
        song
    end

    def artist_name=(name)
        puts name
        self.artist = Artist.find_or_create_by_name(name)
    end

end