require 'text_sender'

describe TextSender do

	let (:text_sender) { TextSender.new }

	it 'can set up client' do
		expect(text_sender.set_up_client).to be_instance_of Twilio::REST::Client
	end

	it 'sends text' do
		text_sender.stub(send_text: nil)
		text_sender.stub(standard_output_message: nil)
		expect(text_sender.confirm_order).to eq nil
	end

	it 'can give delivery time' do
		expect(text_sender.delivery_deadline).to be_instance_of String
	end

end