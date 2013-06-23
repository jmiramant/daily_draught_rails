class BreweryController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	include BreweryHelper
  # def index
  # 	if session[:user_id]
		#  @outing = Brewery.find(session.delete(:outing_id))
  #     render :thanks
  #   else
  #     redirect_to root_path
  #   end
  # end


  def maps
  	location = clean_input(params[:location])
  	if check_for_location_ft(location)
  		Brewery.where("locatlity=?",)
  		@message = "You have a table"
  	else
  		FusionTableWorker.perform_async(location)
  	end
		render :maps
  end

end