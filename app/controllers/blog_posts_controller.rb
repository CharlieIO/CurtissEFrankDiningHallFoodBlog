class BlogPostsController < ApplicationController

  def index
    @posts = BlogPost.all
  end

  def show
    @post = BlogPost.find(params[:id])
  end

  def new
    @post = BlogPost.new
  end

  def create
    @post = BlogPost.new(create_update_params)

    if !@post.location?
      flash[:warning] = "No Location Provided - Failed to Create Blog Post."
      redirect_to(new_blog_post_path()) and return
    elsif !@post.title?
      flash[:warning] = "No Title Provided - Failed to Create Blog Post."
      redirect_to(new_blog_post_path()) and return
    elsif !@post.rating?
      flash[:warning] = "No Rating Provided - Failed to Create Blog Post."
      redirect_to(new_blog_post_path()) and return
    elsif !@post.category?
      flash[:warning] = "No Meal Time Provided - Failed to Create Blog Post."
      redirect_to(new_blog_post_path()) and return
    elsif @post.save
      flash[:notice] = "Blog Post #{@post.title} created!"
      redirect_to(blog_posts_path()) and return
    else
      flash[:warning] = "Warning: Blog Post not created!"
      redirect_to(new_blog_post_path()) and return
    end
  end

private
  def create_update_params
    params.require(:blog_post).permit(:title, :description, :location, :category, :rating)
  end
end
