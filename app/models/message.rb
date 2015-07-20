class Message < ActiveRecord::Base
  before_create :send_sms

private

  def send_sms
    begin
      response = RestClient::Request.new(
        :method => :post,
        :url =>   'https://api.twilio.com/2010-04-01/Accounts/AC3a180156925643ab0f5e91f1449173a7/Messages.json',
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => {  :Body => body,
                       :From => from,
                       :To => to  }
      ).execute
    rescue
      false
    end
  end
end
