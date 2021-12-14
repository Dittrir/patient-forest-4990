class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors
  validates_presence_of :title
  validates_presence_of :creation_year
  validates_presence_of :genre

  def youngest_to_oldest
    Actor.all.order(:age)
  end

  def average_age
    Actor.average(:age).to_f.round(2)
  end
end
