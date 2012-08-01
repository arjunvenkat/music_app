class SongStructure < ActiveRecord::Base
  attr_accessible :note_id, :order, :section, :song_id
  belongs_to :song
  belongs_to :note
  
end
