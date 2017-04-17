class Post < ApplicationRecord
  has_many :comments
  validates_presence_of :body
  validates_presence_of :title

  def no_author?(authors)
    authors.split(',').empty?
  end

  def determine_sentiment
    return if body.empty? && title.empty?
    sentiment_level = SentimentAnalysisLib.new(sensitivity: 7).compute([body, title])
    map_result(sentiment_level)
  end
end
