module OwnTestHelper

  def sign_in(credentials)
    visit signin_path
    fill_in('username', with:credentials[:username])
    fill_in('password', with:credentials[:password])
    click_button('Log in')
  end

  def create_beer_with_rating(score, user)
    style = FactoryGirl.create(:style)
    create_beer(score, style, Brewery.new, user)
  end

  def create_beers_with_ratings(*scores, user)
    style = FactoryGirl.create(:style)
    create_beers(scores, style, Brewery.new, user)
  end

  def create_beers_with_ratings_and_brewery(*scores, brewery, user)
    style = FactoryGirl.create(:style)
    create_beers(scores, style, brewery, user)
  end

  def create_beers_with_ratings_and_style(*scores, style, user)
    create_beers(scores, style, Brewery.new, user)
  end

  def create_beers(scores, style, brewery, user)
    scores.each do |score|
      create_beer(score, style, brewery, user)
    end
  end

  def create_beer(score, style, brewery, user)
    style = FactoryGirl.create(:style)
    beer = FactoryGirl.create(:beer, style:style, brewery:brewery)
    FactoryGirl.create(:rating, score:score, beer:beer, user:user)
    beer
  end
end