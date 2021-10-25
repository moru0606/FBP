class AddCategoryIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :category_id, :string
    add_column :posts, :integer, :string
  end
end
