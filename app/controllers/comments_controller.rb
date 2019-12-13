class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    user = User.where(email: session[:user_email]).take
    @comment.user = user
    mission = Mission.find(comment_params[:mission_id])
    if mission.limit
      num_submissions = Comment.where(user_id: user.id, mission_id: mission.id).length
      if num_submissions >= mission.limit
        flash[:error] = 'You have reached the limit for this submission'
        redirect_to '/completed'
        return
      end
    end
    if @comment.save
      flash[:success] = "Comment posted! Your progress has been logged."
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
    end
    redirect_to '/completed'

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
