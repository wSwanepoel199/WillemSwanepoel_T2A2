class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  acts_as_taggable
  acts_as_taggable_on :tags

  #validations
  validates :title, presence: true
  validates :description, length: {minimum: 10}

  # sanatiseing data
  before_save :remove_whitespace
  private
  def remove_whitespace
    self.title = self.title.strip
    self.description = self.description.strip 
  end

  Listing.includes(:tags => :taggings).map{|listing| listing.tags.map(&:name)}
end