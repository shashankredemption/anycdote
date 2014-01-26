class AddAttachmentAudioToAnycdotes < ActiveRecord::Migration
  def self.up
    change_table :anycdotes do |t|
      t.attachment :audio
    end
  end

  def self.down
    drop_attached_file :anycdotes, :audio
  end
end
