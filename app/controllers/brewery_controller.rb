class BreweryController < ApplicationController
	skip_before_filter  :verify_authenticity_token

  def index
  end

  def maps
  	FusionTableWorker.perform_async(params[:location].downcase.strip)
		render :maps
  end

end