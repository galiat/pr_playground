class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :body

  def self.best(comments)
    comments.sort { |x,y| determine_sentiment(y) <=> determine_sentiment(x) }.first
  end

  def self.rank_order(comments)
    comments.sort { |x,y| determine_sentiment(y) <=> determine_sentiment(x) }
  end

  def render_options(hash)
    hash.keys.each do | key |
      translate(key.downcase)
    end
  end

  def determine_sentiment
    SentimentAnalysisService.determine_sentiment(body)
  end
end
