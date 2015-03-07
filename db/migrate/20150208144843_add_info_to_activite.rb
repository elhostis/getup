class AddInfoToActivite < ActiveRecord::Migration
  def change
    add_column :activites, :publish, :boolean, :default => false
  end
end
