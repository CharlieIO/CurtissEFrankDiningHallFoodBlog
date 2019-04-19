class CommentsController < ApplicationController
  def create
    @post = BlogPost.find(params[:id])
    if @post.nil?
      redirect_to blog_posts_path
    else
      @comment = Comment.new(create_comment_params)
      @comment.user = current_user
      @post.comments << @comment
      # byebug
      
      if @comment.save
        render :partial => @comment
      else
        redirect_to blog_post_path(@post)
      end
    end
  end

private
  def create_comment_params
    params.require(:comment).permit(:comment)
  end
end
