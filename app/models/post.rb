class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, {inclusion: %w(Fiction Non-Fiction)}
  validate :clickbait_check


  def clickbait_check
    pattern = /(Won't Believe|Secret|Top|Guess)/i
    if !pattern.match(title)
      errors.add(:title, "clickbait")
    end
  end
end
