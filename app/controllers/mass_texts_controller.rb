class MassTextsController < ApplicationController
  def new
    @contacts = Contact.all
  end

  def create
    @contacts = Contact.all
  end
end
