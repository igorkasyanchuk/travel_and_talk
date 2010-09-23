class Company < ActiveRecord::Base
  belongs_to :company_category
  has_many :locations, :dependent => :destroy

  def from_usa?
    self.country.present? && self.country == 'United States'
  end
  
end
