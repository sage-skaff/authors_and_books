require 'rails_helper'

RSpec.describe 'Edit Books Page' do
  it 'links to the new page from the books index' do
    author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
    book = Book.create!(title: 'The Hobbit', pages: 310, series: false, author_id: author.id)

    visit "/books/#{book.id}"

    click_link 'Update Book'
    expect(current_path).to eq("/books/#{book.id}/edit")
  end

  it 'has form to edit book' do
    author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
    book = Book.create!(title: 'The Hobbit', pages: 310, series: false, author_id: author.id)

    visit "/books/#{book.id}/edit"

    fill_in('Title', with: 'The Fellowship of the Ring')
    fill_in('Pages', with: '423')
    fill_in('Series', with: 'true')

    click_button 'Update Book'

    expect(current_path).to eq("/books/#{book.id}")
  end
end
