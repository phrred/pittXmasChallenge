class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    user = User.where(email: session[:user_email]).take
    @comment.user = user
    if @comment.save
      flash[:success] = "Comment posted! Your progress has been logged."
      redirect_to '/completed'
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
    end

  end

  private
    def comment_params
      params.require(:comment).permit(:mission_id, :content, :avatar, :video)
    end
end
