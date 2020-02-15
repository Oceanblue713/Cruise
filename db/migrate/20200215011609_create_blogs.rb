class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true
      t.string :company
      t.string :ship
      t.date :date

      t.timestamps
    end
  end
end
