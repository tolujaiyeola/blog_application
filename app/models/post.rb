class Post < ActiveRecord::Base
  attr_accessor :blabla #test attribute accessor
  validates :title, presence: true

  validates :body, presence: true

  # scope :newest_first, -> { order("updated_at DESC") }

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  belongs_to :user
  has_many :comments
  has_many :favourites, dependent: :destroy
  has_many :favourited_users, through: :favourites, source: :user

  def favourite_for(user)
    favourites.find_by_user_id(user.id) if user
  end

end
