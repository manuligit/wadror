class Beer < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
  belongs_to :brewery

  def average_rating
    ratings.average('score')
  end

  def to_s
    "#{name} #{brewery.name}"
  end

end
