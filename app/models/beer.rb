class Beer < ActiveRecord::Base
  has_many :ratings
  belongs_to :brewery

  def average_rating
    ratings.average('score')
  end
end
