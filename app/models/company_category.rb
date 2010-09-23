class CompanyCategory < ActiveRecord::Base
  has_many :company
  validates_uniqueness_of :name
  validates_presence_of :name
end
