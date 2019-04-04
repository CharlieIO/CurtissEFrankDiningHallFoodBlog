class BlogPostsController < ApplicationController

  def index
    @posts = BlogPost.all
  end

  def show
    @posts = BlogPost.find(params[:id])
  end
end
