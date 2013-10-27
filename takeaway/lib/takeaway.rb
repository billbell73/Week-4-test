require_relative 'order_builder'
require_relative 'money'
require_relative 'text_sender'

class Takeaway

	def initialize
		@menu = { margarita: 6.5, mushroom: 7, hawaiian: 7.5 }
	end

	attr_reader :menu

	def start
  	@order_builder = OrderBuilder.new(self)
	end

	def receive order

		expected_price = calculate_price_of order
		Money.new(expected_price, self)
		p "hello"
	end

	def confirm order
		TextSender.new
	end






	# def receive_order_from order_builder, order, money_offered
	# 		if customer_money_correct? order, money_offered
	# 			TextSender.new
	# 		else
	# 			order_builder.raise_money_error
	# 		end
	# end

	# def customer_money_correct? order, money_offered
	# 	calculate_price_of(order) == money_offered 
	# end

	def calculate_price_of order
		order.inject(0){ |sum, dish| sum + @menu[dish] }
	end

end