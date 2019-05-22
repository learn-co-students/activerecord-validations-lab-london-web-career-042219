class Post < ActiveRecord::Base
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbaity

  def clickbaity
    if !title
      errors.add(:title, "Can not be nil!")
      return
    end
    clickbait_titles = ["Won't Believe", "Secret", "Top [0-9]", "guess"]
    clickbait = false
    clickbait_titles.each{|clickbait_title| clickbait |= title.match? clickbait_title}
    errors.add(:title, "Does not contain enough clickbait!") if !clickbait
  end
end
