class CreateSongStructures < ActiveRecord::Migration
  def change
    create_table :song_structures do |t|
      t.integer :song_id
      t.string :section
      t.integer :order
      t.integer :note_id

      t.timestamps
    end
  end
end
