require 'takeaway'
require 'money'
require 'text_sender'

describe 'Takeaway' do

	let (:takeaway) { Takeaway.new }

	let (:order_1) { [:margarita, :margarita] }
	let (:order_2) { [:margarita, :anchovy] }
	

	it 'can calculate the correct price for an order' do
			expect(takeaway.calculate_price_of(order_1)).to eq 13.0
	end

	it 'can calculate the correct price for an order, different example' do
			expect(takeaway.calculate_price_of(order_2)).to eq 13.5
	end

	xit 'can receive an order and send expected price to Money' do
		money = double :money
		expect(money).to receive(:check_money)
		takeaway.receive order_1
	end 

	xit 'can confirm an order' do
		text_sender = double :text_sender, confirm_order: nil
		expect(text_sender).to receive (:confirm_order)
		takeaway.confirm_order
	end

end