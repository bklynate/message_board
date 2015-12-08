class RepliesController < ApplicationController

  def create
    @message = Message.find(params[:message_id])
    @reply = @message.replies.build(reply_params)
    @reply.user_id = current_user.id

    if @reply.save
      flash[:notice] = "Your reply was added!"
      redirect_to  message_path(@message)
    else
      render 'messages/show'
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content,:user_id,:message_id)
  end
end
