require 'money'

describe Money do

	let(:takeaway) {double :takeaway}
	let(:money) {Money.new(10, takeaway)}

	it 'asks for input from user' do
		money.stub(ask_for_money_and_get_input: '12.00')
		expect(money.ask_for_money_and_get_input).to eq "12.00"
	end

	it 'checks whether money tendered correct' do
		amount = "10.00"
		expect(money.money_correct? amount).to be_true
	end

	it 'if money correct, confirms order' do
		money.stub(ask_for_money_and_get_input: '10.00')
		expect(takeaway).to receive(:confirm_order)
		money.check_money
	end

	it 'if money incorrect, raises error' do
		money.stub(ask_for_money_and_get_input: '12.00')
		expect{money.check_money}.to raise_error
	end
	
end