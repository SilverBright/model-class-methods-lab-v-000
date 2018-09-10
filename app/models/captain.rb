class Captain < ActiveRecord::Base
  has_many :boats
  
  def self.catamaran_operators
    Captain.includes(boats: :classifications).where(classifications: {name: "Catamaran"})
  end
  
  def self.sailors
    Captain.includes(boats: :classifications).where(classifications: {name: "Sailboat"}).uniq
  end
  
  def self.talented_seafarers
    mb_cpts = Boat.joins(:classifications).where(:classifications => {name: ["Motorboat"]}).pluck(:captain_id)
    sb_cpts = Boat.joins(:classifications).where(:classifications => {name: ["Sailboat"]}).pluck(:captain_id)
    Captain.where(id: mb_cpts & sb_cpts)
    
  end
  
end
