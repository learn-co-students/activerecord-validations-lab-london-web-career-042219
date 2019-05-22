require 'pry'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    unless self.title != nil && self.title.match?(/Won't Believe|Secret|Top 1..100|Guess/)
      errors.add(:title, "Title is not on the list")
    end
  end
end
