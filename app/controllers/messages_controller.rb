class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:success] = "Your message was created!"
      redirect_to message_path(@message)
    else
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
    @reply = Reply.new
    @replies = @message.replies
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, :user_id)
  end
end
