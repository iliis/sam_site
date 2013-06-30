class Image < ActiveRecord::Base
  attr_accessible :description, :file
  has_attached_file :file, :styles => { :normal => "400x600", :thumb => "210x210", :small_thumb => "100x100" }

  validates :file, :attachment_presence => true
end
