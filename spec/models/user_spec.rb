require 'spec_helper'

##Lisää luokalle User testit, jotka varmistavat, että liian lyhyen tai pelkästään
# kirjaimista muodostetun salasanan omaavan käyttäjän luominen create-metodilla
# ei tallenna olioa tietokantaan, ja että luodun olion validointi ei ole onnistunut

describe User do
  it "has the username set correctly" do
    user = User.new username:"Pekka"

    user.username.should == "Pekka"
  end

  it "is not saved without a password" do
    user = User.create username:"Pekka"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  describe "with a proper password" do
    props = {username:"Pekka", password:"Secret1", password_confirmation:"Secret1"}

    it "is at least four characters long" do
      (props[:password]).should have_at_least(4).characters
    end

    it "is not made up of only letters" do
      ##only checks for one numeral
      (props[:password]).should match /\d+/
    end

    let(:user){ User.create props }

    it "is saved" do
      expect(user).to be_valid
      expect(User.count).to eq(1)
    end


    it "and with two ratings, has the correct average rating" do
      rating = Rating.new score:10
      rating2 = Rating.new score:20

      user.ratings << rating
      user.ratings << rating2

      expect(user.ratings.count).to eq(2)
      expect(user.average_rating).to eq(15.0)
    end

  end
end