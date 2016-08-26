class Blog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, default: 'Untitled'
  field :content

  belongs_to :user
  has_many :comments
end
