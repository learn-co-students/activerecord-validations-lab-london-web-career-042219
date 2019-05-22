class MyValidator < ActiveModel::Validator
  def validate(record)
    options = ["Won't Believe", 'Secret', 'Top [number]', 'Guess']

    unless !record.title.nil? && record.title.match?(/Won't Believe|Secret|Top [0-100]|Guess/)
      record.errors[:title] << 'Not Clickbatey!'
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] } # ,
  # message: "%{value} is not a valid size" }
  validates_with MyValidator
end

# Post category is either Fiction or Non-Fiction This step requires an inclusion validator, which was not outlined in the README lesson. You'll need to refer to the Rails guide to look up how to use it.
