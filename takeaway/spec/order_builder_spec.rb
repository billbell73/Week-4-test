require 'order_builder'

describe OrderBuilder do

	let (:menu) { { margarita: 6.5, mushroom: 7, hawaiian: 7.5 } }
	let (:order_builder) { OrderBuilder.new(menu) }

	it 'displays possible orders' do
		expect(order_builder.menu[:mushroom]).to eq 7
	end

	it 'creates order' do
		takeaway = double :takeaway
		choices = [:margarita, :mushroom]
		total = 13.5
		expect(takeaway).to receive(:order)
		order_builder.order_from takeaway, choices, total
	end

	context 'Margarita pizza order' do

		before do
			order_builder.stub(display_menu_to_customer: 'm')
		end

		xit 'displays menu to customer and asks for pizza choice' do
			# order_builder.stub(display_menu_to_customer: 'm')
			expect(order_builder.display_menu_to_customer).to match /[mah]/
		end

		xit 'can get input from user' do
			expect(order_builder.get_pizza_choice_input).to eq be_instance_of String
		end

		it 'can split whole order into separate pizza orders' do
			total_order = "3M, 2A, 1H"
			expect(order_builder.convert_user_input_format total_order).to eq ["3M", "2A", "1H"]
		end

		it 'can tell if pizza type and quantity understood' do
			pizza_type_and_quantity = "3A"
			expect(order_builder.input_understood? pizza_type_and_quantity).to be_true
		end

		it 'can tell if pizza type and quantity not understood' do
			pizza_type_and_quantity = "3B"
			expect(order_builder.input_understood? pizza_type_and_quantity).to be_false
		end

		it 'can interpret pizza type' do
			pizza_type = "A"
			expect(order_builder.input_lookup pizza_type).to eq :anchovy
		end

		it 'can translate separated pizza type and quantity into format readable by Takeaway' do
			pizza_type = "H"
			quantity = 2
			expect(order_builder.quantify_sub_order quantity, pizza_type).to eq [:hawaiian, :hawaiian]
		end

		it 'can translate joined pizza type and quantity into format readable by Takeaway' do
			pizza_type_and_quantity = "2m"
			expect(order_builder.process_sub_order pizza_type_and_quantity).to eq [:margarita, :margarita]
		end

		it 'can take in user input and produce processed order' do
			order = "1M, 2A 1H"
			expect(order_builder.process_user_input order).to eq [:margarita, :anchovy, :anchovy, :hawaiian]
		end

		it 'can take in user input and produce processed order, different example' do
			order = "1M, 2A 1H"
			expect(order_builder.process_user_input order).to eq [:margarita, :anchovy, :anchovy, :hawaiian]
		end

		it 'can attempt and process clarification of order' do
			order_builder.stub(get_order: '1m 1h')
			expect(order_builder.try_again_for_input).to eq [:margarita, :hawaiian]
		end

		it 'will clarify and process order if initial order unreadable' do
			order_builder.stub(get_order: '2h')
			order = '4s'
			expect(order_builder.process_user_input order).to eq [:hawaiian, :hawaiian]
		end

		it 'can display order, get order and process order' do
			order_builder.stub(get_order: '2a')
			expect(order_builder.get_and_process_order).to eq [:anchovy, :anchovy]
		end		
 
	end 



	context 'Pizza order - order not understood first time' do

		before do
			order_builder.stub(display_menu_to_customer: 'zz')
		end

		xit 'can tell if pizza choice not understood' do
			# order_builder.stub(display_menu_to_customer: 'zz')
			expect(order_builder.pizza_choice_understood?).to be_false
		end

		xit 'will ask again for pizza choice' do

		end

	end
	
end