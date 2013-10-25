require 'takeaway'

describe 'Takeaway' do

	let (:takeaway) { Takeaway.new }
	
	it "can find price of dish" do
		expect(takeaway.menu[:pasta]).to eq 4.5
	end

end