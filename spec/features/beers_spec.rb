require 'spec_helper'

include OwnTestHelper

describe "Beer" do
  before :each do
    FactoryGirl.create :beer
  end

  describe "create a new beer" do
    it "can create a valid beer" do
      visit new_beer_path
      fill_in('beer_name', with:'HC IPA')
      fill_in('beer_style', with:'IPA')
      ##dropdown-valinta:
      page.find_by_id('beer_brewery_id').find("option[value='1']").select_option
      expect{
        click_button('Create Beer')
      }.to change{Beer.count}.by(1)
    end

    it "is redirected back to form when creating fails" do
      visit new_beer_path
      fill_in('beer_style', with:'IPA')
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



  # varmistaa, että järjestelmään voidaan lisätä www-sivun kautta olut,
  # jos oluen nimikenttä saa validin arvon (eli se on epätyhjä). Tee myös
  # testi, joka varmistaa, että selain palaa oluen luomissivulle ja näyttää
  # asiaan kuuluvan virheilmoituksen jos oluen nimi ei ole validi, ja että
  # tälläisessä tapauksessa tietokantaan ei talletu mitään.

end