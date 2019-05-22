class  MyValidator < ActiveModel::Validator
    def validate(record)
        unless record.title != nil && record.title.match?(/Won't Believe|Secret|Top 0-100|Guess/)
            record.errors[:title] << 'Moar clickbait required'
        end
    end
end