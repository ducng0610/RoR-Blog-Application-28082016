# frozen_string_literal: true
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
    blog = Blog.new(@blog_params)
    blog.user = current_user

    unless blog.save
      flash[:danger] = 'Sorry, something went wrong: ' + blog.errors.full_messages.to_s
      redirect_to '/blog/new'
      return
    end

    flash[:success] = 'Successfully created'
    redirect_to "/blog/#{blog.id}/detail"
  end

  # GET
  def edit
    @blog = Blog.where(id: params[:id]).first
  end

  # POST
  def update
    blog = Blog.where(id: params[:id]).first

    unless blog.update(@blog_params)
      flash[:danger] = 'Sorry, something went wrong: ' + blog.errors.full_messages.to_s
      redirect_to "/blog/#{blog.id}/edit"
      return
    end

    flash[:success] = 'Successfully updated'
    redirect_to "/blog/#{blog.id}/detail"
  end

  # POST
  def add_comment
    blog = Blog.where(id: params[:id]).first
    message = params[:message]
    comment = Comment.new(
      user: current_user,
      message: message,
      blog: blog
    )

    if !comment.save
      flash[:danger] = 'Sorry, something went wrong: ' + comment.errors.full_messages.to_s
    else
      flash[:success] = 'Comment added'
    end

    redirect_to "/blog/#{blog.id}/detail"
  end

  private

  def permit_blog_params
    @blog_params = params.require(:blog).permit(:title, :content)
  end
end
