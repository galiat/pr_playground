class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :body

  def determine_sentiment
    SentimentAnalysis.new(sensitivity: 7).compute(body)
  end
end
