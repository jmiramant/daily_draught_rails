$brewery_db = BreweryDB::Client.new do |config|
  config.api_key = '6e3d9a0b001422325a7d2aec2da84e67' or raise "Please create config/env_vars file"
end

# $f_table = GData::Client::FusionTables.new
# $f_table.clientlogin('josh@miramant.me', 'Dc1-ca87')
# $f_table.set_api_key('AIzaSyAnhlqYVBI0bkJlUrMxwQWEiziRV7evB3Q')