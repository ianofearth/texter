require 'rails_helper'

describe Contact do
  it { should validate_presence_of :name }
  it { should validate_presence_of :number }

  it { should have_many :messages }
end
