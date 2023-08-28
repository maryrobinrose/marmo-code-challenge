require_relative 'song'

describe Song do
  subject(:song) { Song.new(1, 'Song Name', ['Pop']) }

  describe '#mark_featured' do
    it 'marks the song as featured' do
      song.mark_featured
      expect(song.featured).to be true
    end
  end

  describe '#unmark_featured' do
    before { song.mark_featured }

    it 'unmarks the song as featured' do
      song.unmark_featured
      expect(song.featured).to be false
    end
  end
end
