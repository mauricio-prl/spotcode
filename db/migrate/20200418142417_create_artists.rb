class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name, unique: true, presence: true

      t.timestamps
    end
  end
end
