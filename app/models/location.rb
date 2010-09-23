class Location < ActiveRecord::Base
  belongs_to :company
  validates_presence_of :name
  scope :forward,  order('created_at ASC')
  scope :backward, order('created_at DESC')  
end
