class Book < ApplicationRecord
  validates_presence_of :title, :pages
  validates :series, inclusion: [true, false]
end
