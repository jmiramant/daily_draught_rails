module BreweryHelper

	def clean_input(input)
  	location = input.downcase.strip
	  (location =~ /\s/) == nil ? location : location.gsub!(/\s/,'_')
		location
	end

	def check_for_location_ft(city)
		$ft = GData::Client::FusionTables.new
	  $ft.clientlogin('josh@miramant.me', ENV['G_FUSION_PASS'])
	  $ft.set_api_key(ENV['G_FUSION'])
		tables = $ft.show_tables
		tables.each do |t|
			if t.name == city
				return true
			end
		end
		return false
	end

	def staleness

	end

end
