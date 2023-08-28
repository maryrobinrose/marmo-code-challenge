class Song
  attr_reader :id, :name, :genres, :featured

  def initialize(id, name, genres)
    @id = id
    @name = name
    @genres = genres
    @featured = false
  end

  def mark_featured
    @featured = true
  end

  def unmark_featured
    @featured = false
  end
end
