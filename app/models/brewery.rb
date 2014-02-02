class Brewery < ActiveRecord::Base
  include RatingAverage

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  ##calls a new Time method so the date should be todays date:
  timestamp = lambda{ Time.new.year }

  validates :name, length: { minimum: 1 }
  validates :year, numericality: { greater_than_or_equal_to: 1042,
                                    less_than_or_equal_to: timestamp.call,
                                    only_integer: true }



end
