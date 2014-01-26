class Anycdote < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "100x100>" }
	has_attached_file :audio, :url => "/assets/:class/:id/:attachment/:style.:extension", :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"
end
