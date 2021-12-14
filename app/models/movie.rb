class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors
  validates_presence_of :title
  validates_presence_of :creation_year
  validates_presence_of :genre

  def youngest_to_oldest
    actors.order(:age)
  end
end
