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
    artist = Artist.find_or_create_by(name: inp)
    artist.songs.build(name: self.name)
    binding.pry
  end

  def artist_name
    self.artist.name
    # binding.pry
  end

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end
end
