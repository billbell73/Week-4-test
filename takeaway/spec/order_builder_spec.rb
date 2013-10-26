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
	
end