class LikesController < ApplicationController
  before_action :find_user, :find_post

  def create
    if already_liked?
      flash[:notice] = "You've already liked this"
    else
      @post.likes.create(user_id: @user.id)
    end
    redirect_to post_path(@post)
  end
    
  private

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_user
    @user = User.find_by_id(current_user.id)
  end
end

