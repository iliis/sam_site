class Post < ActiveRecord::Base
  attr_accessible :content, :title, :visible

  belongs_to :project
end
