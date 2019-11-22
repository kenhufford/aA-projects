class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :author_id
      t.integer :artwork_id

      t.timestamps
    end
  end
end
