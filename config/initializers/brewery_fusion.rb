# require_relative '../env_vars'

$brewery_db = BreweryDB::Client.new do |config|
  config.api_key = "6e3d9a0b001422325a7d2aec2da84e67" or raise "Error with line 4 in intializer/brewery_db.rb "
end

$f_table = GData::Client::FusionTables.new
$f_table.clientlogin('jmiramant@gmail.com', 'Dc1-ca87')
$f_table.set_api_key('AIzaSyD9pz3KZFMik9T8c3iQYW5q9bNw0qk4COY')