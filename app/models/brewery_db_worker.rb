class BreweryDbWorker
	include Sidekiq::Worker

	def perform(location)
		breweries_by_city = $brewery_db.locations.all(locality: location)
		breweries_by_city.each do |breweries|

      latlong = [breweries[:latitude],breweries[:longitude]].join(", ")

	    data = [{
	      "description"          => breweries[:brewery][:description],
	      "status_display"       => breweries[:brewery][:status_display],
	      "website"              => breweries[:brewery][:website],
	      "brewery_id"           => breweries[:brewery][:id],
	      "country"              => breweries[:country][:display_name],
	      "hours_of_operation"   => breweries[:hours_of_operation],
	      "location_type"        => breweries[:location_type],
	      "is_closed"            => breweries[:is_closed],
	      "is_primary"           => breweries[:is_primary],
	      "latlong"              => latlong,
	      "locality"     				 => breweries[:locality],
	      "sub_name"             => breweries[:name],
	      "location_type_display"=> breweries[:location_type],
	      "year_opened"          => breweries[:year_opened]}]

	      fusion_access
	      location.gsub!(/\s/,'_') if location =~ /\s/ >= 0

	     	tables = $ft.show_tables
  			city_table = tables.select{|t| t.name == location }.first
	      city_table.insert(data)
    end
	end

	def fusion_access
	  $ft = GData::Client::FusionTables.new
	  $ft.clientlogin('josh@miramant.me', ENV['G_FUSION_PASS'])
	  $ft.set_api_key(ENV['G_FUSION'])
	end

end