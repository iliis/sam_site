class Post < ActiveRecord::Base
  attr_accessible :content, :title, :visible

  belongs_to :project

  def self.visible
    Post.where(:visible => true)
  end
end
