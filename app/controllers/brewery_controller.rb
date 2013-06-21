class BreweryController < ApplicationController
	skip_before_filter  :verify_authenticity_token

  def index
  	if session[:user_id]
		 @outing = Brewery.find(session.delete(:outing_id))
      render :thanks
    else
      redirect_to root_path
    end
  end

   def new
    @attendee = User.new

    if params[:link]
      @outing = Outing.find_by_link(params[:link])
    else
      @outing = Outing.find(params[:id])
    end

    @movies = @outing.get_movies
    @theaters = @outing.get_theaters
  end

  def maps
  	FusionTableWorker.perform_async(params[:location].downcase.strip)
		render :maps
  end

end