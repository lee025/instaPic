class CommentsController < ApplicationController
  before_action :find_pic

  def create
    @comment = @pic.comments.create(comment_params) do |c|
      c.user = current_user
    end
    if @comment.save
      redirect_to @pic
    else
      redirect_to new_user_session_path, notice: "You need to sign in or sign up before continuing."
      # render json: @comment.errors.full_messages
    end
  end

  def destroy
    @comment = @pic.comments.find(params[:id])
    @comment.destroy
    redirect_to @pic
  end


  private
  def find_pic
    @pic = Pic.find(params[:pic_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
