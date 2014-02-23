class Beer < ActiveRecord::Base
  include RatingAverage
  has_many :ratings, dependent: :destroy
  has_many :raters, -> { uniq }, through: :ratings, source: :user
  belongs_to :brewery
  belongs_to :style

  validates :name, length: { minimum: 1 }
  validates :style, presence: true

  def to_s
    "#{name} #{brewery.name}"
  end


  def self.top(n)
    sorted_by_rating_in_desc_order = Beer.all.sort_by{ |b| -(b.average_rating||0) }
    sorted_by_rating_in_desc_order.take(n)
  end

end
