class Book < ApplicationRecord
  validates_presence_of :title, :pages
  validates :series, inclusion: [true, false]
  belongs_to :author

  def self.all_series
    where(series: true)
  end

  def self.alphabetize
    order(:title)
  end
end
