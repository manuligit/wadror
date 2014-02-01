class Brewery < ActiveRecord::Base
  include RatingAverage

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :name, length: { minimum: 1 }
  validates :yeah, numericality: { greater_than_or_equal_to: 1042,
                                    less_than_or_equal_to: 2014,
                                    only_integer: true }


end
