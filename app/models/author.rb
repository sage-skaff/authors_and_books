class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates_presence_of :name, :age
  validates :living, inclusion: [true, false]

  def self.most_recently_created
    order(created_at: :desc)
  end

  def books_count
    books.count
  end
end
