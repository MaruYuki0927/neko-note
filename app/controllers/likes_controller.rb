class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    like = current_user.likes.build(post_id: @post.id)
    like.save
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: @post.id)
    like.destroy if like
    redirect_to post_path(@post)
  end
end