class BlogPostsController < ApplicationController

  before_action :authenticate_user!, :only=>[:edit, :update, :new, :create, :destroy] 

  def index
    @posts = BlogPost.all
  end

  def show
    @post = BlogPost.find(params[:id])
    @user = @post.user.email
  end

  def edit
    @post = BlogPost.find(params[:id])
    @user_id = current_user.id
  end

  def new
    @post = BlogPost.new
    @user_id = current_user.id
  end

  def update
    @post = BlogPost.find params[:id]
    if (@post.user == current_user)
      @post.update(create_update_params)
      if @post.save
        flash[:notice] = "#{@post.title} was successfully updated!"
        redirect_to edit_blog_post_path(@post) and return
      end
    else
      flash[:warning] = "You don't have permission to do that."
      redirect_to edit_blog_post_path(@post) and return
    end
  end

  def destroy
    @post = BlogPost.find(params[:id])
    if (@post.user == current_user)
      @post.destroy
      flash[:notice] = "Blog Post '#{@post.title}' deleted!"
      redirect_to blog_posts_path()
    else
      flash[:warning] = "You don't have permission to do that."
      redirect_to blog_post_path and return
    end
  end

  def create
    @post = BlogPost.new(create_update_params)
    @post.user_id = current_user.id if current_user

    if !@post.location?
      flash[:warning] = "No Location Provided - Failed to Create Blog Post."
      redirect_to(new_blog_post_path()) and return
    elsif !@post.title?
      flash[:warning] = "No Title Provided - Failed to Create Blog Post."
      redirect_to(new_blog_post_path()) and return
    elsif !@post.rating? && !(@post.rating == 0)
      flash[:warning] = "No Rating Provided - Failed to Create Blog Post."
      redirect_to(new_blog_post_path()) and return
    elsif !@post.category?
      flash[:warning] = "No Meal Time Provided - Failed to Create Blog Post."
      redirect_to(new_blog_post_path()) and return
    elsif @post.save
      flash[:notice] = "Blog Post #{@post.title} created!"
      redirect_to(blog_posts_path()) and return
    else
      flash[:warning] = "Unknown Error"
      redirect_to(new_blog_post_path()) and return
    end
  end

private
  def create_update_params
    params.require(:blog_post).permit(:title, :description, :location, :category, :rating, :image, :current_user)
  end
end
