class BlogController < ApplicationController
  before_action :permit_blog_params, only: [:update, :create]

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
    @blog = Blog.where(id: params[:id]).first
  end

  # POST
  def update
    blog = Blog.where(id: params[:id]).first
    blog.update(@blog_params)
    flash[:success] = 'Successfully updated'
    redirect_to "/blog/#{blog.id.to_s}/detail"
  end

  # POST
  def destroy
    # check chi xoa bai cua minh, co the ko can nho cai token
  end

  private

  def permit_blog_params
    @blog_params = params.require(:blog).permit(:title, :content)
  end
end
