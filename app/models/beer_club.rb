class BeerClub < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships


  def to_s
    "#{name}"
  end

  def beer_club_ids_not_a_member_of
    # get all group_ids and subtract out the ids that he is a member of
    BeerClub.pluck('id') - current_user.beer_clubs.map(&:id)
  end


end
