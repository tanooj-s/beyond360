class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    message_params = params.require(:message).permit(:name, :email, :phone_number, :body)
    @message = Message.new message_params
    if @message.valid?
      MessageMailer.contact_us(@message).deliver_now
      redirect_to new_message_url, notice: "Thank you for your message, we will reply to you as soon as possible!"
    else
      render :new
    end
  end

end
