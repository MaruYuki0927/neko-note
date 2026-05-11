class CatsController < ApplicationController
  before_action :authenticate_user!

  def new
    @cat = Cat.new
  end

  def create
    @cat = current_user.cats.build(cat_params)

    if @cat.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
    @cat = Cat.find(params[:id])
    @posts = @cat.posts
  end

  private

  def cat_params
    params.require(:cat).permit(:name)
  end
end