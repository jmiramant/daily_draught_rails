module ApplicationHelper

	def brewery_db_paserser(location)
		$brewery_db.locations.all(locality: location)
	end

	def generate_fusion_table(data)
		data.each do |breweries|
      latlong = [breweries[:latitude],breweries[:longitude]].join(",")
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

			save_to_fusion_table(api_information)
		end
	end

	def create_brew_ftable

	  ft = GData::Client::FusionTables.new
	  ft.clientlogin('josh@miramant.me', ENV['G_FUSION_PASS'])
	  ft.set_api_key(ENV['G_FUSION'])

	  cols = [
	    {:name => "description",         :type => 'string' },
	    # {:name => "established",         :type => 'number' },
	    # {:name => "image_icon",          :type => 'string' },
	    # {:name => "image_large",         :type => 'string' },
	    # {:name => "image_medium",        :type => 'string' },
	    # {:name => "is_organic",          :type => 'string' },
	    # {:name => "name",                :type => 'string' },
	    # {:name => "status",              :type => 'string' },
	    {:name => "status_display",      :type => 'string' },
	    # {:name => "update_date",         :type => 'string' },
	    {:name => "locality",            :type => 'string' },
	    {:name => "website",             :type => 'string' },
	    {:name => "brewery_id",          :type => 'string' },
	    {:name => "country",             :type => 'string' },
	    {:name => "hours_of_operation",  :type => 'string' },
	    # # {:name => "in_planning",         :type => 'string' },
	    {:name => "location_type",       :type => 'string' },
	    {:name => "is_closed",           :type => 'string' },
	    {:name => "is_primary",          :type => 'string' },
	    {:name => "latlong",                 :type => 'location'},
	    {:name => "sub_name",            :type => 'string' },
	    {:name => "location_type_display", :type => 'string' },
	    # {:name => "phone",               :type => 'number' },
	    # {:name => "open_to_public",      :type => 'string' },
	    # {:name => "postal_code",         :type => 'number' },\  
	    # {:name => "street_address",      :type => 'string' },
	    {:name => "year_opened",         :type => 'number' }]

	    sf_brews = ft.create_table "San Francisco Breweries", cols

end

  def save_to_fusion_table(args)

    ft = GData::Client::FusionTables.new
    ft.clientlogin('josh@miramant.me', ENV['G_FUSION_PASS'])
    ft.set_api_key(ENV['G_FUSION'])

    tables = ft.show_tables
    sf_brew_table  = tables.select{|t| t.name == "San_Francisco_Breweries"}.first

    data = [{
      "description"          => args[:description],
      # "established"          => args[:established],
      # "image_icon"           => args[:image_icon],
      # "image_large"          => args[:image_large],
      # "image_medium"         => args[:image_medium],
      # "is_organic"           => args[:is_organic],
      # "name"                 => args[:name],
      # "status"               => args[:status],
      "status_display"       => args[:status_display],
      # "update_date"          => args[:update_date],
      "website"              => args[:website],
      "brewery_id"           => args[:brewery_id],
      "country"              => args[:country],
      "hours_of_operation"   => args[:hours_of_operation],
      # # "in_planning"          => args[:in_planning],
      "location_type"        => args[:location_type],
      "is_closed"            => args[:is_closed],
      "is_primary"           => args[:is_primary],
      "latlong"                  => args[:lat],
      "long"                  => args[:long],
      "locality"     				 => args[:locality],
      "sub_name"             => args[:sub_name],
      "location_type_display"=> args[:location_type_display],
      # "phone"                => args[:phone],
      # "open_to_public"       => args[:open_to_public],
      # "postal_code"          => args[:postal_code],
      # "street_address"       => args[:street_address],
      "year_opened"          => args[:year_opened]}]

      sf_brew_table.insert(data)
    end
end
