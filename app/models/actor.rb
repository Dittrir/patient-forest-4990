class Actor < ApplicationRecord
  belongs_to :movies
  validates_presence_of :name
  validates_presence_of :age
end
