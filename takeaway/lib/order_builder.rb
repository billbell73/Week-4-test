class OrderBuilder

	def initialize(menu)
		@menu = menu
	end

	attr_reader :menu

	def order_from takeaway, choices, total
		takeaway.order choices, total
	end


end