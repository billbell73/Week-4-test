require 'takeaway'
require 'money'
require 'text_sender'

describe 'Takeaway' do

	let (:takeaway) { Takeaway.new }
	# let (:order_builder) {double :order_builder}

	let (:order_1) { [:margarita, :margarita] }
	let (:order_2) { [:margarita, :mushroom] }
	
	# it "can find price of dish" do
	# 	expect(takeaway.menu[:margarita]).to eq 6.5
	# end

	it 'can calculate the correct price for an order' do
		# takeaway.instance_variable_set(:@order_builder, [])
		expect(takeaway.calculate_price_of(order_1)).to eq 13.0
	end

	it 'can receive an order and send expected price to Money' do
		expected_price = takeaway.calculate_price_of order_1
		expect(Money).to receive(:new).with(expected_price, takeaway)
		takeaway.receive order_1
	end 

	it 'can confirm an order' do
		expect(TextSender).to receive(:new)
		takeaway.confirm order_1
	end

	# it 'can tell if amount offered by customer is correct' do
	# 	expect(takeaway.customer_money_correct?(order_2, 13.5)).to be_true
	# end

	# it 'will send text if customer money correct' do
	# 	order_builder = double :order_builder
	# 	expect(TextSender).to receive(:new)
	# 	takeaway.receive_order_from order_builder, order_1, 13.0
	# end

	# it 'will raise error if customer money not correct' do
	# 	order_builder = double :order_builder
	# 	expect(order_builder).to receive(:raise_money_error)
	# 	takeaway.receive_order_from order_builder, order_1, 12.5

	# end




end