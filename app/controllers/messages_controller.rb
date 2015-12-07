class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      flash[:success] = "Your message was created!"
      redirect_to @message
    else
      render 'new'
    end
  end


  private

  def message_params
    @message = params.require(:message).permit(:title, :content)
  end
end
