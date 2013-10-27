require_relative 'order_builder'
require_relative 'money'
require_relative 'text_sender'

class Takeaway

	def initialize
		@menu = { margarita: 6.5, mushroom: 7, hawaiian: 7.5 }
	end

	attr_reader :menu

	def start
  	order_builder = OrderBuilder.new(self)
  	order_builder.return_order
	end

	def receive order
		expected_price = calculate_price_of order
		money = Money.new(expected_price, self)
		money.check_money
	end

	def confirm_order
		text_sender = TextSender.new
		text_sender.confirm_order
	end

	def calculate_price_of order
		order.inject(0){ |sum, dish| sum + @menu[dish] }
	end

end