class Comment < ActiveRecord::Base
  belongs_to :post

  def weight_of_the_moon
    44443223423525
  end
end
