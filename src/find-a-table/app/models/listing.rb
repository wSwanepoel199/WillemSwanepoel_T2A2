class Listing < ApplicationRecord::Base
  attr_accessible :tag_list
  belongs_to :user
  acts_as_taggable
end
