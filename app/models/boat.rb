class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications
  
  def self.first_five
    Boat.limit(5)
  end
  
  def self.dinghy
    Boat.having('length <= 20').group('id')
  end
  
  
end
