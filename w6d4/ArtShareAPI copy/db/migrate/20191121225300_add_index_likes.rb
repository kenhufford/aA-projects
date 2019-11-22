class AddIndexLikes < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, :author_id
  end
end
