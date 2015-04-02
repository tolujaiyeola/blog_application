class Post < ActiveRecord::Base
  validates :title, presence: true

  validates :body, presence: true

  # scope :newest_first, -> { order("updated_at DESC") }

  has_many :comments
end
