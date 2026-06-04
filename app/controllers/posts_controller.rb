class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    @cats = current_user.cats
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path,
                  notice: "投稿しました！"
    else
      render :new
    end
  end

  def index
    @posts = Post.order(created_at: :desc)
             .page(params[:page])
             .per(6)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @cats = current_user.cats
  end
  
  def update
    @post = Post.find(params[:id])
  
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to posts_path unless @post
  end

  def post_params
    params.require(:post).permit(:title, :body, :image, :cat_id)
  end

end
