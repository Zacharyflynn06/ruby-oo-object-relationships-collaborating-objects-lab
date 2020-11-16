require 'pry'

class Artist

    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end
    
    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(string)
        artist = self.all.find {|i| i.name == string}
        !artist ? self.new(string) : artist
    end

    def print_songs
        songs.each do |song|
            puts song.name
        end
    end
end