class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index 
    @blogs = Blog.all
  end

  def show  
    @blog = Blog.find(params[:id])
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

  def edit 
    @blog = current_user.blogs.find(params[:id])
  end

  def update 
    @blog = current_user.blogs.find(params[:id])
    if @blog.update(blog_params)
      flash[:success] = 'The article has been successfully edited.'
      redirect_to blogs_path(@blog)
    else  
      flash[:danger] = 'The article has not been successfully edited.'
      render :edit
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
    params.require(:blog).permit(:title, :content, :company, :user_id, :date, :ship)
  end
end
