class Location < ActiveRecord::Base
  belongs_to :company
  validates_presence_of :name
  scope :forward,  order('created_at ASC')
  scope :backward, order('created_at DESC')  

  before_save :geocode_it!
  
  def from_usa?
    self.country.present? && self.country == 'United States'
  end
  
  def full_address
    _address = ''
    _address += self.address + ', ' unless self.address.blank?
    _address += self.city + ', ' unless self.city.blank?
    _address += self.state + ', ' unless self.state.blank? if self.from_usa?
    _address += self.country unless self.country.blank?
    _address
  end
  
  def geocode_it!
    if self.address_changed? || self.new_record?
      logger.info "Geocoding: #{self.address}"
      _location = Geokit::Geocoders::MultiGeocoder.geocode(self.address)
      if _location.lat && _location.lng && _location.accuracy
        self.lat = _location.lat
        self.lng = _location.lng
        self.accuracy = _location.accuracy
      else
        self.accuracy = -1
      end
    end
    true
  end
  
  def location_info
    { "lat" => self.lat, "lng" => self.lng, "id" => self.id, "name" => self.name }
  end  
  
end
