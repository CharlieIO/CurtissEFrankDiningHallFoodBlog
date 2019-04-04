class BlogPostsController < ApplicationController

  def index
    @posts = BlogPost.all
  end

  def show
    @post = BlogPost.find(params[:id])
  end

  def edit
    @post = BlogPost.find(params[:id])
  end

  def new
    @post = BlogPost.new
  end

<<<<<<< HEAD
  def edit
    @post = BlogPost.find params[:id]
  end

  def update
    @post = BlogPost.find params[:id]
    @post.update(create_update_params)
    if @post.update(create_update_params)
      flash[:notice] = "#{@post.title} was successfully updated!"
      redirect_to blog_post_url(@post) and return
    else
      flash[:error] = "Warning, property not updated!"
      redirect_to edit_blog_post_path(@post) and return
    end
  end

  def destroy
    @post = BlogPost.find(params[:id])
    @post.destroy
    flash[:notice] = "Blog Post '#{@post.title}' deleted!"
    redirect_to blog_posts_path()
=======
  def update
    id = params[:id]
    p = BlogPost.find(id)
    p.update(create_update_params)
    flash[:notice] = "Successfully Updated Post."
    redirect_to(edit_blog_post_path) and return
>>>>>>> 7e6717263bb21f1fcbc46a7b5efc5c9c04b74534
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
