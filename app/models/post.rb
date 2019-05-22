

class MyValidator < ActiveModel::Validator
    def validate(post)
      unless post.title != nil && post.title.match?(/Won't Believe|Secret|Top 0-100|Guess/)
        post.errors[:title] << 'you need to add clickbait required'
      end
    end
  end
  
   class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validates_with MyValidator
  end