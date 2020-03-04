class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index 
    @blogs = Blog.all
  end

  def show  
  end

  def new 
    @blog = Blog.new
  end 

  def create 
    @blog = current_user.blogs.build(blog_params)
    if @blog.save 
      flash[:success] = 'Article was successfully created.'
      redirect_to blogs_path 
    else  
      flash[:danger] = 'Article was not created.'
      render :new
    end 
  end

  def destroy 
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:success] = 'Article was successfully deleted.'
    redirect_to blogs_path
  end

  private 

  def blog_params 
    params.require(:blog).permit(:title, :content, :company, :user_id)
  end
end
