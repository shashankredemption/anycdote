class CreateAnycdotes < ActiveRecord::Migration
  def change
    create_table :anycdotes do |t|
      t.soundcloud :audio
      t.string :story
      t.string :location

      t.timestamps
    end
  end
end
