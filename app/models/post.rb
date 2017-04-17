class Post < ApplicationRecord
  has_many :comments
  validates_presence_of :body
  validates_presence_of :title

  attr_accessor :my_sentiment

  def no_author?(authors)
    authors.split(',').empty?
  end

  def determine_sentiment
    SentimentAnalysisService.determine_sentiment(body, title)
  end
end
