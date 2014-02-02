class User < ActiveRecord::Base
  include RatingAverage
  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :memberships
  has_many :beer_clubs, through: :memberships

  has_secure_password

  validates :username, uniqueness: true
  validates :username, length: { minimum: 3, maximum: 15 }
  validates :password, length: { minimum: 4 }, format: { with: /(?=.*\d+)(?=.*[A-Z]+).+/ }
  ## regex tarkistaa koko stringin, löytyykö yksi numero ja sitten yksi iso kirjain, väh. yksi

  # että salasanan pituus on vähintää 4 merkkiä, ja että salasana sisältää vähintään
  # yhden ison kirjaimen (voit unohtaa skandit) ja yhden numeron

  def to_s
    "#{name}"
  end

end
