# frozen_string_literal: true
class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :message
  validates_presence_of :message

  belongs_to :user
  belongs_to :blog
end
