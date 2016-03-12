class AddTextToImage < ActiveRecord::Migration
  def change
  	add_column :sousactivite_images, :description, :string
  end
end
