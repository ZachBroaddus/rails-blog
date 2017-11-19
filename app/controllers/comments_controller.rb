class CommentsController < ApplicationController

  def create
    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:name, :body))

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comments.find_by(id: params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end
end
