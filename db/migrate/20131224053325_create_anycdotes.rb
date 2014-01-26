class CreateAnycdotes < ActiveRecord::Migration
  def change
    create_table :anycdotes do |t|
      t.string :story
      t.string :location

      t.timestamps
    end
  end
end
