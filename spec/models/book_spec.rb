require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :pages }
    it { should allow_value(true).for(:series) }
    it { should allow_value(false).for(:series) }
  end

  describe 'relationships' do
    it { should belong_to :author }
  end

  describe 'class methods' do
    it 'can list only books that are in a series' do
      author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
      author2 = Author.create!(name: 'Frank Herbert', age: 65, living: true)
      book = Book.create!(title: 'The Hobbit', pages: 310, series: false, author_id: author.id)
      book2 = Book.create!(title: 'Dune', pages: 412, series: true, author_id: author2.id)
      book3 = Book.create!(title: 'The Fellowship of the Ring', pages: 423, series: true, author_id: author.id)

      expect(Book.all_series).to eq([book2, book3])
    end
  end
end
