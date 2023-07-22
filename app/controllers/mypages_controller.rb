class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite = Favorite.where(user_id: current_user.id)
    @items = @favorite.map{|f| f.item}.flatten

  end
  
end
