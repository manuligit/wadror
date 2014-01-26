class Beer < ActiveRecord::Base
  include RatingAverage
  has_many :ratings, dependent: :destroy
  belongs_to :brewery

  def to_s
    "#{name} #{brewery.name}"
  end

end
