class Blog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, default: 'Untitled'
  field :content, default: 'Please add some content'

  belongs_to :user
  has_many :comments
end
