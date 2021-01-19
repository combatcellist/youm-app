class ItemsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_item, only: [:show, :edit, :update, :destroy, :pay]
  # before_action :force_redirect_unless_my_item, only: [:edit, :update, :destroy, :search]


  def index
    @items = Item.all.order(created_at: :desc)
    @item = Item.search(params[:search])
  end

  def new
    return redirect_to new_profile_path, alert: "プロフィールを登録してください" if current_user.profile.blank?
    @item = Item.new
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end
  
  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path, notice: "メニューが投稿されました"
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path, notice: "メニューが更新されました"
    else
      render :edit
    end
  end

  def destroy
  if @item.destroy
    redirect_to root_path, notice: "メニューが削除されました"
  else
    redirect_to root_path, notice: "メニューを削除できませんでした"
   end
  end

  def search
    @items = Item.search(params[:keyword])
  end

  
  

  private

  def item_params
    params.require(:item).permit(:name, :price, :content, images: []).merge(user_id: current_user.id)
  end
  
  def find_item
    @item = Item.find(params[:id])
  end

  #  def force_redirect_unless_my_item
    #  return redirect_to root_path, alert: "自分のメニューではありません" if @item.user != current_user
  #  end

  

end
