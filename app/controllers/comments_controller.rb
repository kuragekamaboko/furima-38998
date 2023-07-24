class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/items/#{comment.item.id}#comment#{comment.id}"
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user.id == current_user.id && @comment.destroy
      flash[:notice] = "コメント削除に成功しました。"
    else
      flash[:alret] = "コメント削除に失敗しました。"
    end
    redirect_to "/items/#{@comment.item.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
