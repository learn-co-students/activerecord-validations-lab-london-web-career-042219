class Post < ActiveRecord::Base
    validates :title, presence: :true 
    validates :content, length: { minimum:  250}
    validates :summary, length: { maximum:  250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait

    def clickbait
        unless self.title != nil && self.title.match?(/Won't Believe|Secret|Top 0-100|Guess/)
            self.errors[:title] <<"Add Clickbait Words"
        end
    end 
end
