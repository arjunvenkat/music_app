class Song < ActiveRecord::Base
  attr_accessible :bpm, :name, :song_structure
  has_many :song_structures
end
