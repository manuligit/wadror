require 'spec_helper'

include OwnTestHelper

describe "Beer" do
  let!(:user) { FactoryGirl.create :user }

  before :each do
    FactoryGirl.create :beer
    sign_in(username:"Pekka", password:"Foobar1")
  end

  describe "creating" do
    it "can create a valid beer" do
      visit new_beer_path
      fill_in('beer_name', with:'HC IPA')
      ##dropdown-valinta:
      ##page.find_by_id('beer_brewery_id').find("option[value='1']").select_option
      expect{
        click_button('Create Beer')
      }.to change{Beer.count}.by(1)

    end

    it "is redirected back to form when creating fails" do
      visit new_beer_path
      ##dropdown-valinta:
      page.find_by_id('beer_brewery_id').find("option[value='1']").select_option
      ##odotetaan ettei tietokantaan tapahdu mitään ja ettei beer.count vaihdu:
      expect{
        click_button('Create Beer')
      }.to change{Beer.count}.by(0)


      # expect(current_path).to eq(new_beer_path)
      # testataan purkasti beers_path:ia new_beer_path:in sijaan koska modelissa on määritelty render:new etteivät
      # formit resettoituisi
      expect(current_path).to eq(beers_path)
      expect(page).to have_content 'Name is too short'
    end


  end

end