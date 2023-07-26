class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = Favorite.find_by(item_id: params[:item_id],user_id: current_user.id);
    if @favorite
      @favorite.destroy
      favoriteNum = Favorite.where(item_id: params[:item_id]).count
      render json:{ isSuccess:true,deleted:true,favoriteCount: favoriteNum,message:'お気に入りを解除しました。' }
    else 
      Favorite.create(item_id: params[:item_id],user_id: current_user.id)
      favoriteNum = Favorite.where(item_id: params[:item_id]).count
      render json:{ isSuccess:true,deleted:false,favoriteCount: favoriteNum,message:'お気に入り登録をしました。' }
    end

  end

 
end
