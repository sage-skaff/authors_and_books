require 'rails_helper'

RSpec.describe 'Books Show Page' do
  it 'lists books attributes' do
    author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
    author2 = Author.create!(name: 'Frank Herbert', age: 65, living: true)
    book = Book.create!(title: 'The Hobbit', pages: 310, series: false, author_id: author.id)
    book2 = Book.create!(title: 'Dune', pages: 412, series: true, author_id: author2.id)

    visit "/books/#{book.id}"
    expect(current_path).to eq("/books/#{book.id}")

    expect(page).to have_content('The Hobbit')
    expect(page).to have_content('310')
    expect(page).to have_content('Series: false')
    expect(page).to have_content('J.R.R. Tolkien')
    expect(page).to_not have_content('Dune')
    expect(page).to_not have_content('412')
    expect(page).to_not have_content('Series: true')
    expect(page).to_not have_content('Frank Herbert')
  end

  it 'has links for authors index and books index' do
    author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
    book = Book.create!(title: 'The Hobbit', pages: 310, series: false, author_id: author.id)

    visit "/books/#{book.id}"

    expect(page).to have_link('Authors Index')
    expect(page).to have_link('Books Index')
  end

  it 'has link to delete book' do
    author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
    book = Book.create!(title: 'The Hobbit', pages: 310, series: false, author_id: author.id)

    visit "/books/#{book.id}"

    expect(page).to have_link('Delete Book')
    click_link 'Delete Book'
    expect(current_path).to eq('/books')
    expect(page).to_not have_content('The Hobbit')
  end
end
