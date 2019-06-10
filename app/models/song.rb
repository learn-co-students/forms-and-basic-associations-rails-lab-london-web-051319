class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    genre ? genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist ? artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      if content.length > 0
      self.notes << Note.find_or_create_by(content: content)
      end
      end
  end

  def note_contents
    notes ? notes.map(&:content) : nil
  end

end
