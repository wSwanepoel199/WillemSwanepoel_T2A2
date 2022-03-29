class Listing < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :tags

  pg_search_scope :global_search, lambda{|search, query|
    raise ArgumentError unless [:title, :tag_list].include?(search)
    {
      against:search,
      query: query
    }
  }
end
