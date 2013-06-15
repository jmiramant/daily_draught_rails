$brewery_db = BreweryDB::Client.new do |config|
  config.api_key = ENV['BREWERY_DB'] or raise "Please create config/env_vars file"
end

$f_table = GData::Client::FusionTables.new
$f_table.clientlogin('josh@miramant.me', ENV['G_FUSION_PASS'])
$f_table.set_api_key(ENV['G_FUSION'])