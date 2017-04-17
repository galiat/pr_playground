class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :body

  def render_options(hash)
    hash.keys.each do | key |
      translate(key.downcase)
    end
  end
end
