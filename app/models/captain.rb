class Captain < ActiveRecord::Base
  has_many :boats
  
  def self.catamaran_operators
    Captain.includes(boats: :classifications).where(classifications: {name: "Catamaran"})
  end
  
  def self.sailors
    Captain.includes(boats: :classifications).where(classifications: {name: "Sailboat"}).uniq
  end
  
  def self.talented_seafarers
    Captain.includes("id IN (?)", self.motorboats.pluck(:id) & self.sailboats.pluck(:id))
  end
  
end
