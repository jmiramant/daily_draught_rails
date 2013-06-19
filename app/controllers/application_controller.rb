class ApplicationController < ActionController::Base
  include ApplicationHelper
  # helper_method :generate_fusion_table, :brewery_db_paserser, :create_brew_ftable, :save_to_fusion_table
  protect_from_forgery

end
