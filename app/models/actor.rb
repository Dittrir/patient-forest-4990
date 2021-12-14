class Actor < ApplicationRecord
  belongs_to :movie
  validates_presence_of :name
  validates_presence_of :age

  def self.youngest_to_oldest
    all.order(:age)
  end

  def self.average_age
    average(:age).to_f.round(2)
  end
end
