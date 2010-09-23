class AddCityToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :city, :string
  end

  def self.down
    remove_column :companies, :city
  end
end
