class FusionTableWorker
	include Sidekiq::Worker

	def perform(city_name)
	  $ft = GData::Client::FusionTables.new
	  $ft.clientlogin('josh@miramant.me', ENV['G_FUSION_PASS'])
	  $ft.set_api_key(ENV['G_FUSION'])

	  cols = [
	    {:name => "description",         	:type => 'string' },
	    {:name => "status_display",      	:type => 'string' },
	    {:name => "locality",            	:type => 'string' },
	    {:name => "website",             	:type => 'string' },
	    {:name => "brewery_id",          	:type => 'string' },
	    {:name => "country",             	:type => 'string' },
	    {:name => "hours_of_operation",  	:type => 'string' },
	    {:name => "location_type",       	:type => 'string' },
	    {:name => "is_closed",           	:type => 'string' },
	    {:name => "is_primary",          	:type => 'string' },
	    {:name => "latlong",             	:type => 'location'},
	    {:name => "sub_name",            	:type => 'string' },
	    {:name => "location_type_display",:type => 'string' },
	    {:name => "year_opened",         	:type => 'number' }]

	    $ft.create_table city_name, cols
			BreweryDbWorker.perform_async(city_name)
	end
end