require 'rails_helper'

describe Message do
  it "doesen't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '11111', :from => '5034448816')
    expect(message.save).to(be false)
  end
end
