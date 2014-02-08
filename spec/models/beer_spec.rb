require 'spec_helper'

describe Beer do

  it "has name and style set correctly" do
    beer = Beer.new name:"Punk ipa", style:"IPA"

    beer.name.should == "Punk ipa"
    beer.style.should == "IPA"
  end

  it "is not saved without a name" do
    beer = Beer.create style:"IPA"

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

  it "is not saved without style" do
    beer = Beer.create name:"Punk ipa"

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

end
