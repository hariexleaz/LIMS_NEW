class Location < ActiveRecord::Base
 
acts_as_gmappable
 attr_accessible :address, :gmaps, :latitude, :longitude, :name

attr_accessible :address, :latitude, :longitude
geocoded_by :address
after_validation :geocode,:if=>:address_changed?


def gmaps4rails_address
   address
end

end
