require 'test_helper'

class SentimentAnalysisService < ActiveSupport::TestCase
  test "#determine_sentiment" do
    assert_nil SentimentAnalysisService.determine_sentiment()
    assert_nil SentimentAnalysisService.determine_sentiment(nil, nil, nil)

    cases = [
      { input: ["simply the worst"], expectation: Sentiment::Negative }
      { input: ["simply the worst", "abhorant"], expectation: Sentiment::StrongNegative }
      { input: ['pizza', "fries"], expectation: Sentiment::Neutral }
      { input: ["only the best", "simply the worst"], expectation: Sentiment::Mixed }
      { input: ["only the best"], expectation: Sentiment::Positive }
      { input: ["Awesome possum", 'the best'], expectation: Sentiment::StrongPositive }
    ]

    cases.each do |test_case|
      result = SentimentAnalysisService.determine_sentiment(*test_case[:input])
      assert  result == test_case[:expectation]
    end
  end
end
