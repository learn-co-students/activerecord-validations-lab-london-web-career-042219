class Post < ActiveRecord::Base
  
    validates :title, presence:true 
    validates :content, length: { minimum:250 }
    validates :summary, length: { maximum:250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
    validate  :clickbait

    def clickbait
        clickbaitword=false
        if title
            check=["Won't Believe", "Secret", "Top [0-9]", "Guess"] 
            check.each do |word|
                if title.match?word
                 clickbaitword=true
                end         
            end        
            if !clickbaitword
             errors.add(:title, "Not click bait")
            end
        end
    end

end
