Twitter.configure do |config|
  config.consumer_key = ENV["TWIT_CONSUMER_ID"]
  config.consumer_secret = ENV["TWIT_CONSUMER_SECRET"]
end