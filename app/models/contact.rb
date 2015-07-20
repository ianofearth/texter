class Contact < ActiveRecord::Base
  has_many :messages

  validates :name, :presence => true
  validates :number, :presence => true
end
