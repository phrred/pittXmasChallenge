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

  def update
    @comment = Comment.find(params[:comment_id])
    if @comment.update(comment_params)
      flash[:success] = "Comment updated!"
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
    end
    redirect_to profile_path
  end

  def delete
    comment = Comment.find(params[:comment_id])
    if comment.avatar.attached?
      comment.avatar.purge_later
    end
    if comment.video.attached?
      comment.video.purge_later
    end
    comment.destroy
    redirect_to profile_path
  end

  private
    def comment_params
      params.require(:comment).permit(:mission_id, :content, :avatar, :video)
    end
end
