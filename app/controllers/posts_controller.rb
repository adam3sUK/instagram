class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to user_path(current_user.id)
  end

  def show
    @post = Post.find(params[:id])
    @post_owner = User.find_by_id(@post.user.id)
  end


  private
  
  def post_params
    params.require(:post).permit(:body, :image)
  end
end
