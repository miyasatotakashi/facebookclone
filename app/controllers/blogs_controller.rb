class BlogsController < ApplicationController
  #省略
  def create
    @blog = current_user.blogs.build(blog_params)
  #省略
  end
  #省略
  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
end