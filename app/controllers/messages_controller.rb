class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @contact = Contact.find(params[:contact_id])
    @message = Message.new
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @message = @contact.messages.new(message_params)
    if @message.save
      flash[:notice] = "Sent"
      redirect_to contact_path(@contact)
    else
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:from, :body, :to => [])
  end
end
