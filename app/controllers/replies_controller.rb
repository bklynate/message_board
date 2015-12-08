class RepliesController < ApplicationController
  def new
    @reply = Reply.new
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def create

  end

  private

  def reply_params
    params.require(:reply).permit(:content,:user_id)
  end
end
