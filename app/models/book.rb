class Book < ApplicationRecord
  validates_presence_of :title, :pages
  validates :series, inclusion: [true, false]
  belongs_to :author

  def self.all_series
    all.where(series: true)
  end
end
