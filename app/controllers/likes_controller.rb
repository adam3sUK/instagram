class LikesController < ApplicationController
  before_action :find_user

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(user_id: @user.id)
    redirect_to post_path(@post)
  end
    
  private

  def find_user
    @user = User.find_by_id(current_user.id)
  end
end

