class CatsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

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

  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
    @posts = @cat.posts
  end

  def edit
  end
  
  def update
    if @cat.update(cat_params)
      redirect_to cat_path(@cat)
    else
      render :edit
    end
  end

  def correct_user
    @cat = current_user.cats.find_by(id: params[:id])
  
    redirect_to root_path unless @cat
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age, :introduction, :image, :gender)
  end

end