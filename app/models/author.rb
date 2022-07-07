class Author < ApplicationRecord
  validates_presence_of :name, :age
  validates :living, inclusion: [true, false]
  has_many :books
end
