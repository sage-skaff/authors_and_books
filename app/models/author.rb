class Author < ApplicationRecord
  validates_presence_of :name, :age
  validates :living, inclusion: [true, false]
  has_many :books

  def self.most_recently_created
    order(created_at: :desc)
  end

  def books_count
    books.count
  end
end
