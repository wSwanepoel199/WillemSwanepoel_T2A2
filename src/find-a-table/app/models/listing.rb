class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  acts_as_taggable_on :tags

  def user
    User.all
  end
end