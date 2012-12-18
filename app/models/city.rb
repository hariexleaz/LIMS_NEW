class City < ActiveRecord::Base
  belongs_to :country
  has_many :locations, :dependent => :destroy
        accepts_nested_attributes_for :locations, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

     def location_name
         location.try(:name)
     end

     def location_name=(name)
         self.location = Location.find_or_create_by_name(name) if name.present?
     end



end
