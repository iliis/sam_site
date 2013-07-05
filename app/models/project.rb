class Project < ActiveRecord::Base
  attr_accessible :description, :title, :short_desc, :preview, :state, :visible
  has_attached_file :preview

  has_many :posts

  def self.all_states
    ["abandoned", "active", "finished"]
  end
end
