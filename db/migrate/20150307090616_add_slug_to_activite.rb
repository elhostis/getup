class AddSlugToActivite < ActiveRecord::Migration
  def change
    add_column :activites, :slug, :string
  end
end
