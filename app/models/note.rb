class Note < ActiveRecord::Base
  attr_accessible :form, :name, :song_structure
  has_many :song_structures
end
