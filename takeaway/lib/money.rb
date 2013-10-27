class Money

	def initialize(amount_expected, calling_object)
		@amount_expected = amount_expected
		@calling_object = calling_object
	end

	def check_money
		if money_correct? ask_for_money_and_get_input
			@calling_object.confirm_order
		else
			raise "Sorry, the money tendered was an incorrect amount"
		end
	end

	def ask_for_money_and_get_input
		puts
		puts "Thank you for your order."
		puts "How much money will you be tendering for this order?"
		print "  £ "
		money_tendered = gets.chomp()
	end

	def money_correct? amount_tendered
		amount_tendered.to_f == @amount_expected
	end

end