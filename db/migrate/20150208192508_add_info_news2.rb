class AddInfoNews2 < ActiveRecord::Migration
  def change
    add_column :news, :publish, :boolean, :default => false
  end
end
