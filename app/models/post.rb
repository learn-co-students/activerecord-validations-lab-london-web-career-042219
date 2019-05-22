require 'pry'

class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.title != nil && record.title.match?(/Won't Believe|Secret|Top 0-100|Guess/)
      record.errors[:title] << 'Moar clickbait required'
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

