class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def note_array
    return [["C", "C"],[ "C#/Db","C sharp"], ["D","D"], ["D#/Eb","D sharp"], ["E","E"], 
      ["F","F"],["F#/Gb","F sharp"],["G","G"],["G#/Ab","G sharp"],["A","A"],["A#/Bb","A sharp"],["B","B"]]
  end
  
  def section_array
    return [["verse","verse"], ["chorus", "chorus"], ["bridge", "bridge"], ["key", "key"]]
  end
  
  def note_form_array
    return [["major", "major"],["minor", "minor"]]
  end
  
  def songs_info
   @songs_info = []
    Song.all.each do |song|
      song_info = [song.name, song.id]
      @songs_info << song_info
    end
    return @songs_info
  end
end
