require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should allow_value(true).for(:living) }
    it { should allow_value(false).for(:living) }
  end

  describe 'relationships' do
    it { should have_many :books }
  end

  describe 'class methods' do
    it 'can list authors by most recently created' do
      author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
      author2 = Author.create!(name: 'Frank Herbert', age: 65, living: true)
      author3 = Author.create!(name: 'Isaac Asimov', age: 72, living: false)

      expect(Author.most_recently_created).to eq([author3, author2, author])
    end
  end

  describe 'instance methods' do
    it 'can count the number of books an author has' do
      author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
      author2 = Author.create!(name: 'Frank Herbert', age: 65, living: true)
      author3 = Author.create!(name: 'Isaac Asimov', age: 72, living: false)

      book = Book.create!(title: 'The Hobbit', pages: 310, series: false, author_id: author.id)
      book2 = Book.create!(title: 'Dune', pages: 412, series: true, author_id: author2.id)
      book3 = Book.create!(title: 'The Fellowship of the Ring', pages: 423, series: true, author_id: author.id)

      expect(author.books_count).to eq(2)
      expect(author2.books_count).to eq(1)
    end
  end
end
