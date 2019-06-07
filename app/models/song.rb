class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    genre ? genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist.nil? ? nil : artist.name
  end

  def note_contents
    notes ? notes.map(&:content) : nil
  end

  def note_contents=(contents)
    contents = contents.reject(&:empty?)
    contents.each do |content|
      self.notes << Note.find_or_create_by(content: content)
    end
  end

end
