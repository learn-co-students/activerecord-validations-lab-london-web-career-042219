class MyValidator < ActiveModel::Validator
  def validate(post)
    unless post.title != nil && post.title.match?(/Won't Believe|Secret|Top 0-100|Guess/)
      post.errors[:title] << 'you need to add clickbait required'
    end
  end
end