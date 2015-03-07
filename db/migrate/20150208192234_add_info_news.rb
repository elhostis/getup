class AddInfoNews < ActiveRecord::Migration
  def change
    add_column :news, :title, :string
    add_column :news, :image, :string
  end
end
