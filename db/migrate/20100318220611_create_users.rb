class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string  :email,              :null => false
      t.string  :first_name,         :null => false
      t.string  :last_name,          :null => false
      t.string  :crypted_password,   :null => false
      t.string  :password_salt,      :null => false

      # tokens
      t.string :persistence_token,   :null => false
      t.string :single_access_token, :null => false
      t.string :perishable_token,    :null => false

      # statistics (magic columns)
      t.integer  :login_count,        :null => false, :default => 0
      t.integer  :failed_login_count, :null => false, :default => 0
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string   :current_login_ip
      t.string   :last_login_ip
      t.timestamps
    end

    add_index :users, :email, :unique => true
  end

  def self.down
    drop_table :users
  end
end
