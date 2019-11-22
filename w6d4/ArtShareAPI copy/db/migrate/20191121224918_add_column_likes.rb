class AddColumnLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :author_id, :integer
  end
end
