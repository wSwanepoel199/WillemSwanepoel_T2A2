class Listing < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :tags
  pg_search_scope :global_search, lambda { |search, query|
    raise ArgumentError unless ["title"].include?(search)
    {
      against: search,
      query: query,
      using: {
        tsearch: { :prefix => true }
      }
    }
  }
  has_one_attached :picture

  def username
    user.username
  end
end