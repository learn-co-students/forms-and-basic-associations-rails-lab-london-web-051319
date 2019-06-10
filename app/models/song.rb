# require "pry"

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(inp)
    self.genre = Genre.find_or_create_by(name: inp)
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(inp)
    self.artist = Artist.find_or_create_by(name: inp)
  end

  def artist_name
    self.artist.name
  end

  def note_contents=(notes_arr)
    notes = Note.create(content: notes_arr)
    self.notes << notes
  end

  def note_contents
    val = self.notes
    val.content

  end
end
