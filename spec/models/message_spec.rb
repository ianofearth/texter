require 'rails_helper'

describe Message, :vcr => true do
  it "doesen't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '11111', :from => '5034448816')
    expect(message.save).to(be false)
  end

  it "adds an error if the number is invalid" do
    message = Message.new(:body => 'hi', :to => '11111', :from => '5034448816')
    message.save
    expect(message.errors[:base]).to(eq(["The 'To' number 11111 is not a valid phone number."]))
  end
end
