class CreateArtistInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_instruments do |t|
      t.belongs_to :artist, foreign_key: true
      t.belongs_to :instrument, foreign_key: true

      t.timestamps
    end
  end
end
