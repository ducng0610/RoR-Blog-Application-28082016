# frozen_string_literal: true
namespace :duc4nh do
  desc 'add content'
  task add_content: :environment do
    (1..50).each do |index|
      a = Blog.new
      a.content = random_str(1000)
      a.title = random_str(50)
      a.user = User.first
      a.save
      (1..(rand(10) + 10)).each do |c|
        b = Comment.new
        b.message = random_str(100)
        b.user = User.first
        b.blog = a
        b.save
      end
    end
  end

  private

  def random_str(no)
    (0...no).map { (('a'..'z').to_a + [' ', ' ', ' ']).to_a[rand(29)] }.join
  end
end
