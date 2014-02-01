class Beer < ActiveRecord::Base
  include RatingAverage
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user
  has_many :users, through: :ratings
  belongs_to :brewery

  validates :name, length: { minimum: 1 }

  def to_s
    "#{name} #{brewery.name}"
  end

end
