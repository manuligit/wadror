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

  def favorite_beer
    return nil if ratings.empty?   # palautetaan nil jos reittauksia ei ole
    ratings.order(score: :desc).limit(1).first.beer
  end

  def to_s
    "#{username}"
  end


  ##favorite_style, joka palauttaa tyylin, jonka oluet ovat saaneet käyttäjältä keskimäärin korkeimman reittauksen.
  # Lisää käyttäjän sivulle tieto käyttäjän mielityylistä.

  ##tässä ruma ja ihan liian pitkä purkkaratkaisu, mutta tulipahan tehtyä:
  def favorite_style
    return nil if ratings.empty?
    #haetaan ratingit, lisää scoret stylen mukaan palauttaa parhaan stylen
    else
    styles_and_scores = [] #taulukko, johon kootaa muuttujat
    tyylit = []
    # otetaan style beer_id:n avulla beereistä:
    ratings.each do |r|
      styles_and_scores << { :style => Beer.find_by(id: r.beer_id).style, :score => r.score }
      tyylit << Beer.find_by(id: r.beer_id).style
    end

    max = 0
    highest_average_style = ''

    tyylit.uniq.each do |t|
      stylet = styles_and_scores.find_all { |s|
        s[:style] == t
      }

      total_score = 0

      stylet.each { |s|
        total_score += s[:score]
      }

      if (total_score/stylet.count) > max
        max = total_score
        highest_average_style = t
      end
    end

    return highest_average_style

  end

  ##jälleen krapulainen copypaste-metodi mutta ainakin se toimii:
  def favorite_brewery
    return nil if ratings.empty?
      #haetaan ratingit, lisää scoret stylen mukaan palauttaa parhaan stylen
  else
    breweries_and_scores = [] #taulukko, johon kootaa muuttujat
    panimot = []
    # otetaan style beer_id:n avulla beereistä:
    ratings.each do |r|
      breweries_and_scores << { :brewery => Beer.find_by(id: r.beer_id).brewery.name, :score => r.score }
      panimot << Beer.find_by(id: r.beer_id).brewery.name
    end

    max = 0
    highest_average_brewery = ''

    panimot.uniq.each do |t|
      skoret = breweries_and_scores.find_all { |s|
        s[:brewery] == t
      }

      total_score = 0

      skoret.each { |s|
        total_score += s[:score]
      }

      if (total_score/skoret.count) > max
        max = total_score
        highest_average_brewery = t
      end
    end

    return highest_average_brewery.to_s
  end

end
