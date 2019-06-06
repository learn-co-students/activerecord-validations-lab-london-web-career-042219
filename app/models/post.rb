class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    record.title ||= ''
    words = ["Won't Believe", /Top \d/, "Secret", "Guess"]
    check = words.any? do |word|
      record.title.match?(word)
    end
    if !check
      record.errors[:base] << "Not clickbaity enough"
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates_with ClickbaitValidator
end
