require 'rubygems'
require 'twilio-ruby'
 
# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC4aa469ca587217afccb959428cd169f8'
auth_token = '49720322117d9afbac7125555f374a4f'
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.sms.messages.create(:body => "Hello please?! <3",
    :to => "+44 7809 618148",     # Replace with your phone number
    :from => "+44 1228 834007")   # Replace with your Twilio number
puts message.sid