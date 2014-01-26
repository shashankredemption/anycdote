class AddAttachmentImageToAnycdotes < ActiveRecord::Migration
  def self.up
    change_table :anycdotes do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :anycdotes, :image
  end
end
