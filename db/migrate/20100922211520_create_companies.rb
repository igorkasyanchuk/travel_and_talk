class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.integer :user_id
      t.string :country
      t.string :state
      t.string :address
      t.string :zip
      t.text :description
      t.string :contact_email
      t.string :phone
      t.string :web_site
      t.timestamps
    end
    add_index :companies, :user_id
    create_table :companies_users, :id => false do |t|
      t.integer :company_id
      t.integer :user_id
    end
    add_index :companies_users, :company_id
    add_index :companies_users, :user_id
  end

  def self.down
    remove_index :companies, :user_id
    drop_table :companies
    remove_index :companies_users, :company_id
    remove_index :companies_users, :user_id
    drop_table :companies_users
  end
end
