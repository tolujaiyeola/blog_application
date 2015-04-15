class Post < ActiveRecord::Base
  validates :title, presence: true

  validates :body, presence: true

  # scope :newest_first, -> { order("updated_at DESC") }
  belongs_to :user
  has_many :comments
  has_many :favourites, dependent: :destroy
  has_many :favourited_users, through: :favourites, source: :user
end
