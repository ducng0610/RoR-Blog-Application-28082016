require 'will_paginate/array'

class DashboardController < ApplicationController
  def index
  end

  def blogs
    @blogs = Blog.all.order(updated_at: :desc).paginate(page: params[:page], per_page: 10)
  end
end
