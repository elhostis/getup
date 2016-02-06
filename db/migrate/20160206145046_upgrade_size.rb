class UpgradeSize < ActiveRecord::Migration
  def change
  	change_column :sousactivite_images, :image, :string, :limit => 1000
  end
end
