# frozen_string_literal: true
require 'will_paginate/array'

class DashboardController < ApplicationController
  def index
    @recent_blogs = Blog.order(updated_at: :desc).limit(10)

    blog_ids = Comment.only(:blog_id).all.group_by(&:blog_id)
                      .map { |key, val| { key => val.count } }
                      .sort_by { |blog| blog.values.first }
                      .reverse
    blog_ids = blog_ids[0..9].map { |blog_id| blog_id.keys.first }
    @most_commented_blogs = Blog.where(:id.in => blog_ids)
  end

  def blogs
    @blogs = Blog.all.order(updated_at: :desc).paginate(page: params[:page], per_page: 10)
  end
end
