class MassTextsController < ApplicationController
  def new
    @contacts = Contact.all
  end

  def create
    @contacts = Contact.find(params[:contact_ids])
    @contacts.each do |contact|
      @message = contact.messages.new(body: params[:body], from: '5034448816', to: contact.number )
      if @message.save
        flash[:notice] = "Sent"
      else
        render :new
      end
    end
    redirect_to contacts_path
  end
end
