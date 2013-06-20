desc "Scrape Beer Advocate"

task :beer_advocate => :environment do

  require 'mechanize'
  agent = Mechanize.new

  beer_count = 1
  agent.get('http://beeradvocate.com/beer/profile/18564/#{beer_count}')
    title: page.search('.titleBar').text.strip,
    ba_score: page.search('.BAscore_big').text.strip,




  # agent.get("http://railscasts.tadalist.com/session/new")
  # form = agent.page.forms.first
  # form.password = "secret"
  # form.submit

  # agent.page.link_with(:text => "Wish List").click
  # agent.page.search(".edit_item").each do |item|
  #   Product.create!(:name => item.text.strip)
  # end


end