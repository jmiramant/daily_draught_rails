module ApplicationHelper

	def fusion_table_fetch(location)
		$ft.show_tables.each do |t|
			@table = t if t.name == location.snake_case
		end
		@table
	end

	def remove_ws
		gsub!(/\_/,' ')
	end

	def add_ws
		downcase.gsub!(/\s/,'_')
	end
end
