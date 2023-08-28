require_relative 'song'

class Artist
  attr_reader :id, :name, :songs, :top_genres, :featured_song_id

  def initialize(id, name)
    @id = id
    @name = name
    @songs = []
    @top_genres = []
    @featured_song_id = nil
  end

  def add_song(song)
    @songs << song
    update_artist_info
    update_featured_song(song) if song.featured
  end

  def remove_song(song)
    @songs.delete(song)
    update_artist_info
    update_featured_song(nil) if song.featured
  end

  private

  def update_artist_info
    genre_counts = Hash.new(0)

    @songs.each do |song|
      song.genres.each do |genre|
        genre_counts[genre] += 1
      end
    end

    @top_genres = genre_counts.sort_by { |genre, count| -count }.map(&:first).first(3)
  end

  def update_featured_song(new_song)
    @featured_song_id = new_song ? new_song.id : nil
  end
end
