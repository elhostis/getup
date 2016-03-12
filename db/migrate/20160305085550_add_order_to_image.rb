class AddOrderToImage < ActiveRecord::Migration
  def change
  	add_column :sousactivite_images, :row_order, :integer, default: 0
  end
end
