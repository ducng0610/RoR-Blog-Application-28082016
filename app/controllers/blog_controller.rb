class BlogController < ApplicationController
  # GET
  def index
    @blogs = current_user.blogs.paginate(page: params[:page], per_page: 10)
  end

  # GET
  def new
  end

  # GET
  def detail
    @blog = Blog.where(id: params[:id]).first
  end

  # POST
  def create
  end

  # GET
  def edit
  end

  # POST
  def update
  end

  # POST
  def destroy
    # check chi xoa bai cua minh, co the ko can nho cai token
  end
end
