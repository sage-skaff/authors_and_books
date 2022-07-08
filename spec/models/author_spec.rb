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

      expect(Author.most_recently_created).to eq([author, author2, author3])
    end
  end
end
