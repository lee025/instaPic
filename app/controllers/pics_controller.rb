class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show] #devise docs

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def show
  end

  def new
    @pic = current_user.pics.build
  end

  def create
    @pic = current_user.pics.build(pic_params)
    if @pic.save
      redirect_to @pic, notice: "Successfully posted pic!" 
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: "Pic was successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.id == @pic.user_id
      @pic.destroy
      redirect_to root_path, notice: "Pic was successfully deleted"
    end
  end

  def upvote
    if current_user.liked? @pic
      @pic.downvote_from current_user
      redirect_to @pic
    else
      @pic.liked_by current_user
      redirect_to @pic
    end
  end


  private
  def find_pic
    @pic = Pic.find(params[:id])
  end

  def pic_params
    params.require(:pic).permit(:title, :description, :image)
  end

end
