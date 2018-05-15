class SentimentAnalysisService
  def determine_sentiment(*phrases)
    return if phrases.any?(&:empty?)
    sentiment_level = SentimentAnalysisLib.new(sensitivity: 7).compute(phrases)
    map_result(sentiment_level)
  end
end
