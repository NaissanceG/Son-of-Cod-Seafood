class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
    flash[:success] = "Your comment is saved!"
    redirect_to :back
  else
    flash[:alert] = "Unsuccesfull, please try commenting again"
    render root_path
  end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end
private
  def comment_params
    params.require(:comment).permit(:content)

  end
end
