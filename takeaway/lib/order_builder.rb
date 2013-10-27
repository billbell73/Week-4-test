class OrderBuilder

	def initialize(takeaway)
		@takeaway = takeaway
		@menu = @takeaway.menu
		@input_lookup = {"M" => :margarita, "A" => :anchovy, "H" => :hawaiian}
		return_order
	end

	attr_reader :menu

	def return_order
		order = get_and_process_order
		@takeaway.receive order
	end

	def get_and_process_order
		display_menu_to_customer
		process_user_input get_order
	end

	def display_menu_to_customer
		puts 
		puts "Will's Pizzas - Menu"
		puts "Margarita pizza (M): £6.50"
		puts "Anchovy pizza (A):  £7.00"
		puts "Hawaiian pizza (H):  £7.50"
	end

	def get_order
		puts
		puts "What type of pizza would you like?"
		puts "[for example, \"1A\" equals 1 Anchovy pizza..."
		puts "or \"3M, 1A, 2H\" equals 3 Margarita pizzas, 1 Anchovy pizza & 2 Hawaiian pizzas]"
		order = gets.chomp()
	end

	def process_user_input order
		separated_orders = convert_user_input_format order
		processed_order = []
		separated_orders.each do | pizza_type_and_quantity |
			if input_understood? pizza_type_and_quantity
				processed_order.concat process_sub_order pizza_type_and_quantity
			else
				return try_again_for_input
			end
		end
		processed_order
	end

	def convert_user_input_format total_order
		total_order.scan(/\w+/)
	end

	def input_understood? pizza_type_and_quantity
		pizza_type_and_quantity =~ /\d[MAH]/i
	end

	def input_lookup pizza_type
		@input_lookup[pizza_type]
	end

	def process_sub_order pizza_type_and_quantity
		quantity = pizza_type_and_quantity.to_i
		pizza_type = pizza_type_and_quantity[1].upcase
		quantify_sub_order quantity, pizza_type
	end

	def quantify_sub_order quantity, pizza_type
		sub_order = []
		quantity.times{sub_order << input_lookup(pizza_type)}
		sub_order
	end

	def try_again_for_input
		puts
		puts "Sorry, we did not understand your order."
		process_user_input get_order
	end

end