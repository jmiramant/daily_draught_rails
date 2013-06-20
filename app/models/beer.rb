class Beer < ActiveRecord::Base
	belongs_to :brewery
  # attr_accessible :title, :body
end
