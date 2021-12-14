class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors, through: :studio
end
