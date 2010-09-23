class CreateCompanyCategories < ActiveRecord::Migration
  def self.up
    add_column :companies, :company_category_id, :integer
    Company.reset_column_information
    create_table :company_categories do |t|
      t.string :name
      t.timestamps
    end
    ["Accommodation", "Transportation", "Dining", "Attraction", "Security"].each do |c|
      CompanyCategory.create(:name => c)
    end
    Company.all.each do |c|
      c.company_category_id = CompanyCategory.first.id
    end
  end

  def self.down
    drop_table :company_categories
  end
end
