require 'rails_helper'

RSpec.describe 'Books Index Page' do
  it 'lists names of all the books and their attributes' do
    author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
    author2 = Author.create!(name: 'Frank Herbert', age: 65, living: true)
    book = Book.create!(title: 'The Fellowship of the Ring', pages: 423, series: true, author_id: author.id)
    book2 = Book.create!(title: 'Dune', pages: 412, series: true, author_id: author2.id)

    visit '/books'
    within '#index-0' do
      expect(page).to have_content('The Fellowship of the Ring')
      expect(page).to have_content('423')
      expect(page).to have_content('Series: true')
      expect(page).to have_content('J.R.R. Tolkien')
      expect(page).to_not have_content('Dune')
      expect(page).to_not have_content('412')
      expect(page).to_not have_content('Frank Herbert')
    end

    within '#index-1' do
      expect(page).to have_content('Dune')
      expect(page).to have_content('412')
      expect(page).to have_content('Series: true')
      expect(page).to have_content('Frank Herbert')
      expect(page).to_not have_content('The Hobbit')
      expect(page).to_not have_content('310')
      expect(page).to_not have_content('J.R.R. Tolkien')
    end
  end

  it 'has links for authors index and books index' do
    visit '/books'

    expect(page).to have_link('Authors Index')
    expect(page).to have_link('Books Index')
  end

  it 'only shows books that are in a series' do
    author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
    author2 = Author.create!(name: 'Frank Herbert', age: 65, living: true)
    book = Book.create!(title: 'The Hobbit', pages: 310, series: false, author_id: author.id)
    book2 = Book.create!(title: 'Dune', pages: 412, series: true, author_id: author2.id)
    book3 = Book.create!(title: 'The Fellowship of the Ring', pages: 423, series: true, author_id: author.id)

    visit '/books'

    expect(page).to have_content('Dune')
    expect(page).to have_content('The Fellowship of the Ring')
    expect(page).to_not have_content('The Hobbit')
  end

  it 'has links to update books' do
    author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
    author2 = Author.create!(name: 'Frank Herbert', age: 65, living: true)
    book = Book.create!(title: 'The Fellowship of the Ring', pages: 423, series: true, author_id: author.id)
    book2 = Book.create!(title: 'Dune', pages: 412, series: true, author_id: author2.id)

    visit '/books'
    within '#index-0' do
      expect(page).to have_link('Update Book')
    end

    within '#index-1' do
      expect(page).to have_link('Update Book')
    end
  end
end
