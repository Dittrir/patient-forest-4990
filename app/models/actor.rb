class Actor < ApplicationRecord
  belongs_to :movie
  validates_presence_of :name
  validates_presence_of :age

  def self.youngest_to_oldest
    Actor.all.order(:age)
  end
end
