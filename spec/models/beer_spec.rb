require 'spec_helper'

describe Beer do

  it "has name and style set correctly" do
    style = Style.new name:"Lager", description:"Superb"
    beer = Beer.new name:"Punk ipa", style:style

    beer.name.should == "Punk ipa"
    beer.style.should == style
  end

  it "is not saved without a name" do
    style = Style.new name:"Lager", description:"Superb"
    beer = Beer.create style:style

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

  it "is not saved without style" do
    beer = Beer.create name:"Punk ipa"

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end
end
