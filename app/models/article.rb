class Article < ApplicationRecord
  belongs_to :category

  scope :alphabetical, order('title')
  scope :active, where('active = ?', true)

  validates_presence_of :content, :title
end
