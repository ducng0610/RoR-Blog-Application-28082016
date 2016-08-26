# frozen_string_literal: true
class Blog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content

  validates_presence_of :title
  validates_presence_of :content

  belongs_to :user
  has_many :comments
end
