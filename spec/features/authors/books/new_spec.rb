require 'rails_helper'

RSpec.describe 'New Authors Books Page' do
  it 'links to the new page from the authors books index' do
    author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
    visit "/authors/#{author.id}/books"

    click_link 'Create Book'
    expect(current_path).to eq("/authors/#{author.id}/books/new")
  end

  it 'has form to create new book' do
    author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
    visit "/authors/#{author.id}/books/new"

    fill_in(title: 'The Hobbit')
    fill_in(pages: '310')
    fill_in(series: 'false')
    click_button 'Create Book'

    expect(current_path).to eq("/authors/#{author.id}/books")
    expect(page).to have_content('The Hobbit')
  end
end
