class Note < ActiveRecord::Base
  attr_accessible :form, :name
  has_many :song_structures
end
