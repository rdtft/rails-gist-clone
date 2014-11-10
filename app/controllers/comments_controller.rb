class CommentsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json

  def create
    @user = current_user
    @gist = Gist.find(params[:gist_id])
    @comment = @gist.comments.create(comment_params.merge({user_id: @user.id}))
    redirect_to gist_path(@gist)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body, :gist_id, :user_id)
  end
end
