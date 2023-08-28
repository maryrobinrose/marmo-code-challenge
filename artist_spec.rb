require_relative 'song'
require_relative 'artist'

RSpec.describe Artist do
  describe '.new' do
    it 'creates a new artist with the provided attributes' do
      artist = Artist.new(1, 'Some Artist')
      expect(artist.id).to eq(1)
      expect(artist.name).to eq('Some Artist')
    end
  end

  describe '#add_song' do
    it 'correctly adds a song to the artist' do
      artist = Artist.new(1, 'Some Artist')
      song = Song.new(1, 'Song 1', ['Folk', 'Pop'])
      artist.add_song(song)

      expect(artist.songs).to include(song)
    end
  end

  describe '#remove_song' do
    it 'correctly removes a song from the artist' do
      artist = Artist.new(1, 'Some Artist')
      song = Song.new(1, 'Song 1', ['Folk', 'Pop'])
      artist.add_song(song)
      artist.remove_song(song)

      expect(artist.songs).not_to include(song)
    end
  end

  describe '#update_featured_song' do
    it 'correctly updates the featured song for the artist' do
      artist = Artist.new(1, 'Some Artist')
      song1 = Song.new(1, 'Song 1', ['Folk', 'Pop'])
      song2 = Song.new(2, 'Song 2', ['Pop', 'Rock'])
      artist.add_song(song1)
      artist.add_song(song2)

      artist.send(:update_featured_song, song2)
      expect(artist.featured_song_id).to eq(2)
    end
  end

  describe '#top_genres' do
    it 'returns the top genres of the artist' do
      artist = Artist.new(1, 'Some Artist')
      song1 = Song.new(1, 'Song 1', ['Folk', 'Pop'])
      song2 = Song.new(2, 'Song 2', ['Pop', 'Rock'])
      artist.add_song(song1)
      artist.add_song(song2)

      expect(artist.top_genres).to contain_exactly('Folk', 'Pop', 'Rock')
    end
  end

  describe '#songs.count' do
    it 'correctly calculates the song count after adding and removing songs' do
      artist = Artist.new(1, 'Some Artist')
      song1 = Song.new(1, 'Song 1', ['Folk', 'Pop'])
      song2 = Song.new(2, 'Song 2', ['Pop', 'Rock'])
      artist.add_song(song1)
      artist.add_song(song2)

      artist.remove_song(song1)
      artist.add_song(song1)

      expect(artist.songs.count).to eq(2)
    end
  end
end
