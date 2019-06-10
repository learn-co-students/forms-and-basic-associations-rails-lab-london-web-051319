class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(contents)
    contents = contents.reject{|content| content.empty? }
    contents.each do |content|
      note = Note.find_or_create_by(content: content)
      self.notes << note  
    end
  end

  def note_contents
    notes ? notes.map{|note| note.content} : nil 
  end

  # def note_contents=(notes)
  #   @note = Note.find_or_create_by(:song_id == self)
  #   Note.song << self
  # end

  # def note_contents
  #   @note ? @note.content : nil
  # end
end
