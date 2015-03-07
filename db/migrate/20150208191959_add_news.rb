class AddNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :intro
      t.string :more

      t.timestamps
    end
  end
end
