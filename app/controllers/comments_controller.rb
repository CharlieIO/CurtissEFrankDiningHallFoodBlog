class CommentsController < ApplicationController
  def create
    @post = BlogPost.find(params[:id])
    # if @post.nil?
    #   redirect_to blog_posts_path
    # else
    @comment = Comment.new(create_comment_params)
    @comment.user = current_user
    @post.comments << @comment
    comment = Comment.new(create_comment_params)
    comment.user = current_user
    
    # redirect_to blog_post_path(@post)
    # byebug
    # if @comment == ''
    #   redirect_to blog_post_path(@post)
    
    if @comment.save
      # byebug
      render :partial => comment
      # redirect_to blog_post_url(@post)
    end
      # redirect_to blog_post_path(@post)
    # else
    #   redirect_to blog_post_path(@post)
    # end
    
  end

private
  def create_comment_params
    params.require(:comment).permit(:comment)
  end
end
