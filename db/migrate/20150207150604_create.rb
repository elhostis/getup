class Create < ActiveRecord::Migration
  def change
    create_table :activites do |t|
      t.string :title

      t.timestamps
    end

    create_table :sousactivites do |t|
      t.string   "title"
      t.text     "description"
      t.string   "slug"
      t.boolean  "publish",          :default => false, :null => false

      t.belongs_to :activite

      t.timestamps
    end
    add_index "sousactivites", ["slug"], :name => "index_sousactivites_on_slug"

    create_table :sousactivite_images do |t|
      t.string  "image"

      t.timestamps

      t.belongs_to :sousactivite
    end

    add_index :sousactivite_images, :sousactivite_id
    add_index :sousactivites, :activite_id

  end
end
