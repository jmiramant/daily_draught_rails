class Brewery < ActiveRecord::Base
	has_many :beers
  attr_accessible :location_lookup, :brewery_id, :country, :brewer_id, :description, :hours_of_operation, :is_closed, :is_primary, :latlong, :locality, :location_type, :location_type_display, :status_display, :sub_name, :website, :year_opened
end
