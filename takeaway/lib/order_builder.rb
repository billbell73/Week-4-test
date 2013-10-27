class OrderBuilder

	def initialize(menu)
		@menu = menu
		@input_lookup = {"M" => :margarita, "A" => :anchovy, "H" => :hawaiian}
	end

	attr_reader :menu

	def order_from takeaway, choices, total
		takeaway.order choices, total
	end

	# def get_order
	# 	display_menu_to_customer
	# 	while !pizza_choice_understood?
	# 		get_pizza_choice_input
	# 	end

	# end

	def display_menu_to_customer
		puts "Hangdog Pizza - Menu"
		puts "Margarita pizza (M): £6.50"
		puts "Anchovy pizza (A):  £7.00"
		puts "Hawaiian pizza (H):  £7.50"
		# get_pizza_choice_input
	end

	def get_pizza_choice_input
		puts "What type of pizza would you like?"
		puts "[for example, \"1A\" equals 1 Anchovy pizza..."
		puts "... and, \"3M, 1A, 2H\" equals 3 Margarita pizzas, 1 Anchovy pizza & 2 Hawaiian pizzas]"
		order = gets.chomp()
		# figure_out-input order
		# choice.downcase
	end

	# def process_user_input total_order
	# 	order_separated = convert_user_input_format total_order
	# 	processed_order = []
	# 	order_separated.each do | pizza_type_and_quantity |
	# 		if input_understood? pizza_type_and_quantity
	# 			process_sub_order pizza_type_and_quantity
	# 		else
	# 			puts "help"
	# 		end
	# 	processed_order
	# end

	def convert_user_input_format total_order
		total_order.scan(/\d\w/)
	end

	def input_understood? pizza_type_and_quantity
		pizza_type_and_quantity =~ /\d[MAH]/
	end

	def input_lookup pizza_type
		@input_lookup[pizza_type]
	end

	# def process_sub_order pizza_type_and_quantity
	# 	processed_order = []
	# 	quantity = pizza_type_and_quantity.to_i
	# 	pizza_type = pizza_type_and_quantity[1].upcase
	# 	quantity.times(processed_order << input_lookup(pizza_type))
	# 	processed_order
	# end

	def process_sub_order quantity, pizza_type
		processed_order = []
		quantity.times{processed_order << input_lookup(pizza_type)}
		processed_order
	end


end