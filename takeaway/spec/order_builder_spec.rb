require 'order_builder'

describe OrderBuilder do

	let (:menu) { {pasta: 4.5, pizza: 5, curry: 9} }
	let (:order_builder) { OrderBuilder.new(menu) }

	it 'displays possible orders' do
		expect(order_builder.menu[:pizza]).to eq 5
	end

	it 'creates order' do
		takeaway = double :takeaway
		choices = [:pizza, :pasta]
		total = 9.5
		expect(takeaway).to receive(:order)
		order_builder.order_from takeaway, choices, total
	end
	
end