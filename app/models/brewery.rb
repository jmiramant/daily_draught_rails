class Brewery < ActiveRecord::Base
  attr_accessible :brewery_id, :country, :brewer_id, :description, :hours_of_operation, :is_closed, :is_primary, :latlong, :locality, :location_type, :location_type_display, :status_display, :sub_name, :website, :year_opened
end
