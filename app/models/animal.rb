class Animal < ApplicationRecord
  validates :name, presence: true
  validates :kind, presence: true
  validates :breed, presence: true
  validates :age, presence: true
end
