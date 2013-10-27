require 'twilio-ruby'

class TextSender

	# def initialize
	# 	send_text_confirming_order
	# end

	def delivery_deadline
		time_now = Time.now
		delivery_time = time_now + (60 * 60)
		"#{delivery_time.hour}:#{delivery_time.min}"
	end

	def confirm_order
		set_up_client
		send_text
		standard_output_message
	end

	def set_up_client
		account_sid = 'AC4aa469ca587217afccb959428cd169f8'
		auth_token = '49720322117d9afbac7125555f374a4f'
		@client = Twilio::REST::Client.new account_sid, auth_token
	end

	def	send_text
		message = @client.account.sms.messages.create(
			:body => "Thank you. Your order was placed and will be delivered before #{delivery_deadline}",
		    :to => "+44 7809 618148",    
		    :from => "+44 1228 834007")  
	end

	def standard_output_message
		puts "Thank you for your order. Confirmation has been sent by SMS"
	end


end