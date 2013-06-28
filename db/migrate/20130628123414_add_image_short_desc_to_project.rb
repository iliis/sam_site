class AddImageShortDescToProject < ActiveRecord::Migration
  def change
    add_column :projects, :short_desc, :text
    add_attachment :projects, :preview
    add_column :projects, :state, :string
  end
end
