class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  acts_as_taggable_on :tags

  def self.search(search)
    if search
      where("lower(listings.title) LIKE :search OR lower(users.username) LIKE :search", search: "%#{search.downcase}%").uniq
    else all
    end
  end

  def user
    User.all
  end
end