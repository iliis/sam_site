class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.string :title
      t.references :project

      t.timestamps
    end

    add_index :posts, :project_id
  end
end
