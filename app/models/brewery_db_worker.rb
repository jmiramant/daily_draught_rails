class BreweryDbWorker
	include Sidekiq::Worker

	def perform(location)
		breweries_by_city = $brewery_db.locations.all(locality: location)
		api_information = nil
		breweries_by_city.each do |breweries|
      latlong = [breweries[:latitude],breweries[:longitude]].join(", ")

			api_information = { description: breweries[:brewery][:description],
											 status_display: breweries[:brewery][:status_display],
												      website: breweries[:brewery][:website],
												   brewery_id: breweries[:brewery][:id],
												      country: breweries[:country][:display_name],
									 hours_of_operation: breweries[:hours_of_operation],
												location_type: breweries[:location_type],
												    is_closed: breweries[:is_closed],
												   is_primary: breweries[:is_primary],
    													latlong: latlong,
											       locality: breweries[:locality],
												     sub_name: breweries[:name],
												location_type: breweries[:location_type],
										# 	          phone: breweries[:phone],
										# 	 open_to_public: breweries[:open_to_public],
										# 		  postal_code: breweries[:postal_code],
										# 		 state_region: breweries[:region],
										# 	 street_address: breweries[:street_address],
												  year_opened: breweries[:year_opened]}
	    data = [{
	      "description"          => api_information[:description],
	      # "established"          => api_information[:established],
	      # "image_icon"           => api_information[:image_icon],
	      # "image_large"          => api_information[:image_large],
	      # "image_medium"         => api_information[:image_medium],
	      # "is_organic"           => api_information[:is_organic],
	      # "name"                 => api_information[:name],
	      # "status"               => api_information[:status],
	      "status_display"       => api_information[:status_display],
	      # "update_date"          => api_information[:update_date],
	      "website"              => api_information[:website],
	      "brewery_id"           => api_information[:brewery_id],
	      "country"              => api_information[:country],
	      "hours_of_operation"   => api_information[:hours_of_operation],
	      # # "in_planning"          => api_information[:in_planning],
	      "location_type"        => api_information[:location_type],
	      "is_closed"            => api_information[:is_closed],
	      "is_primary"           => api_information[:is_primary],
	      "latlong"              => api_information[:latlong],
	      "locality"     				 => api_information[:locality],
	      "sub_name"             => api_information[:sub_name],
	      "location_type_display"=> api_information[:location_type_display],
	      # "phone"                => api_information[:phone],
	      # "open_to_public"       => api_information[:open_to_public],
	      # "postal_code"          => api_information[:postal_code],
	      # "street_address"       => api_information[:street_address],
	      "year_opened"          => api_information[:year_opened]}]


				city_ftable = fusion_table_fetch(location)
	      city_ftable.insert(data)
    end
	end

  def fusion_table_fetch(location)
		$ft.show_tables.each do |t|
			@table = t if t.name == location
		end
		@table
	end

end