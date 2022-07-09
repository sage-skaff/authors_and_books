require 'rails_helper'

RSpec.describe 'Authors Show Page' do
  it 'lists authors attributes' do
    author = Author.create!(name: 'John Green', age: 44, living: true)
    author2 = Author.create!(name: 'Isaac Asimov', age: 72, living: false)

    visit "/authors/#{author.id}"
    expect(page).to have_content('John Green')
    expect(page).to have_content('44')
    expect(page).to have_content('Living')
    expect(page).to_not have_content('Isaac Asimov')
    expect(page).to_not have_content('72')
    expect(page).to_not have_content('Deceased')
  end

  it 'lists books count' do
    author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
    author2 = Author.create!(name: 'Frank Herbert', age: 65, living: true)
    author3 = Author.create!(name: 'Isaac Asimov', age: 72, living: false)

    book = Book.create!(title: 'The Hobbit', pages: 310, series: false, author_id: author.id)
    book2 = Book.create!(title: 'Dune', pages: 412, series: true, author_id: author2.id)
    book3 = Book.create!(title: 'The Fellowship of the Ring', pages: 423, series: true, author_id: author.id)

    visit "/authors/#{author.id}"
    expect(page).to have_content('Number of Books: 2')

    visit "/authors/#{author2.id}"
    expect(page).to have_content('Number of Books: 1')
  end
end
