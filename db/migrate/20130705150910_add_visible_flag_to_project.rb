class AddVisibleFlagToProject < ActiveRecord::Migration
  def change
    add_column :projects, :visible, :boolean
    add_column :posts,    :visible, :boolean
  end
end
