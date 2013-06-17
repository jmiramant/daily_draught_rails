class BreweryController < ApplicationController
  def index
  end

  def maps
  	create_brew_ftable
		breweries_by_city = brewery_db_parserser(params[:location])
		generate_fusion_table(breweries_by_city)
		render :maps
  end

end