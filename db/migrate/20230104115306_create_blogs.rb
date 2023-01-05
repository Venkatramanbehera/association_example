class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
