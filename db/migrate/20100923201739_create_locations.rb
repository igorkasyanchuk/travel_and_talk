class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :company_id
      t.string :name
      t.text :description
      t.string :country
      t.string :state
      t.string :city
      t.string :address
      t.timestamps
    end
    add_column :locations, "lat", :decimal, :precision => 15, :scale => 10, :default => 0.0
    add_column :locations, "lng", :decimal, :precision => 15, :scale => 10, :default => 0.0      
    add_column :locations, :accuracy, :integer, :default => -1
    add_index :locations, :company_id
  end

  def self.down
    remove_index :locations, :company_id
    drop_table :locations
  end
end
