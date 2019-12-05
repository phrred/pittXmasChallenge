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
    puts "HERE"
    @comment = Comment.find(params[:comment_id])
    if @comment.update(comment_params)
      flash[:success] = "Comment updated!"
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
    end
    redirect_to profile_path
  end

  private
    def comment_params
      params.require(:comment).permit(:mission_id, :content, :avatar, :video)
    end
end
