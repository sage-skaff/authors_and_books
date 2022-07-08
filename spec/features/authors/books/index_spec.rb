require 'rails_helper'

RSpec.describe 'author Books Index Page', type: :feature do
  #  User Story 5, Parent Children Index
  #
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes:
  it 'displays the books in a author with their attributes' do
    author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
    author2 = Author.create!(name: 'Frank Herbert', age: 65, living: true)
    book = Book.create!(title: 'The Hobbit', pages: 310, series: false, author_id: author.id)
    book2 = Book.create!(title: 'Dune', pages: 412, series: true, author_id: author2.id)
    book3 = Book.create!(title: 'The Fellowship of the Ring', pages: 423, series: true, author_id: author.id)

    visit "/authors/#{author.id}/books"

    within '#index-0' do
      expect(page).to have_content('The Hobbit')
      expect(page).to have_content('310')
      expect(page).to have_content('Series: false')
      expect(page).to have_content('J.R.R. Tolkien')
      expect(page).to_not have_content('Dune')
      expect(page).to_not have_content('412')
      expect(page).to_not have_content('Series: true')
      expect(page).to_not have_content('Frank Herbert')
    end

    within '#index-1' do
      expect(page).to have_content('Dune')
      expect(page).to have_content('412')
      expect(page).to have_content('Series: true')
      expect(page).to have_content('Frank Herbert')
      expect(page).to_not have_content('The Hobbit')
      expect(page).to_not have_content('310')
      expect(page).to_not have_content('Series: false')
      expect(page).to_not have_content('J.R.R. Tolkien')
    end
  end
end
