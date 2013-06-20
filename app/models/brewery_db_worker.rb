class BreweryDbWorker
	include Sidekiq::Worker

	def perform(location)
		breweries_by_city = $brewery_db.locations.all(locality: location)
		breweries_by_city.each do |breweries|
      latlong = [breweries.latitude,breweries.longitude].join(", ")

	    data = {
	      :description           => breweries.brewery.description,
	      :status_display        => breweries.brewery.status_display,
	      :website               => breweries.brewery.website,
	      :brewery_id            => breweries.brewery.id,
	      :country               => breweries.country.display_name,
	      :hours_of_operation    => breweries.hours_of_operation,
	      :location_type         => breweries.location_type,
	      :is_closed             => breweries.is_closed,
	      :is_primary            => breweries.is_primary,
	      :latlong               => latlong,
	      :locality     				 => breweries.locality,
	      :sub_name              => breweries.name,
	      :location_type_display => breweries.location_type,
	      :year_opened           => breweries.year_opened    }

	      #=> having issues with gsub
	      # if location =~ /\s/ >= 0
	      # 	location.gsub!(/\s/,'_')
	      # end

	      fusion_access

	     	tables = $ft.show_tables
  			city_table = tables.select{|t| t.name == location }.first
	      city_table.insert(data)
	      create_in_db(data)
    end
	end

	def create_in_db(args)
	  Brewery.create(
		  		 description: args[:description],
	      status_display: args[:status_display],
	      			 website: args[:website],
	      		 brewer_id: args[:brewery_id],
	      		   country: args[:country],
	  hours_of_operation: args[:hours_of_operation],
	       location_type: args[:location_type],
	           is_closed: args[:is_closed],
	          is_primary: args[:is_primary],
	             latlong: args[:latlong],
	            locality: args[:locality],
	            sub_name: args[:sub_name],
 location_type_display: args[:location_type_display],
           year_opened: args[:year_opened]
	  	)
	end

	def fusion_access
	  $ft = GData::Client::FusionTables.new
	  $ft.clientlogin('josh@miramant.me', ENV['G_FUSION_PASS'])
	  $ft.set_api_key(ENV['G_FUSION'])
	end

end