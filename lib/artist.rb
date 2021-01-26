 class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def save
        @@all << self
    end

    def self.all 
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select do |song| 
            song.artist == self
        end
    end

    def self.find_or_create_by_name(name)
        found_artist = @@all.detect{|artist| artist.name == name}
        if found_artist.nil?
            return Artist.new(name)
        else
            return found_artist
        end
    end

    def print_songs
        songs.each do |song|
            puts song.name
        end
    end

 end