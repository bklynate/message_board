class RepliesController < ApplicationController
  def new
    @reply = Reply.new
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def create
    @message = Mesage.find(params[:post_id])
    @reply = @message.replies.build(params.require(:comment).permit(:content))

    if @comment.save
      flash[:notice] = "Your commant was added!"
      redirect_to message_path(@message)
    else
      render 'messages/show'
    end
  end
  
  private

  def reply_params
    params.require(:reply).permit(:content,:user_id)
  end
end
