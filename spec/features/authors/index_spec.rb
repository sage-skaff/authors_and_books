require 'rails_helper'

RSpec.describe 'Authors Index Page' do
  it 'lists names of all the authors' do
    author = Author.create!(name: 'John Green', age: 44, living: true)
    author2 = Author.create!(name: 'Isaac Asimov', age: 72, living: false)

    visit '/authors'
    expect(page).to have_content('John Green')
    expect(page).to have_content('Isaac Asimov')
  end

  it 'lists authors names by the time the record was created and lists the time next to their name' do
    author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)
    author2 = Author.create!(name: 'Frank Herbert', age: 65, living: true)
    author3 = Author.create!(name: 'Isaac Asimov', age: 72, living: false)

    visit '/authors'
    within '#index-0' do
      expect(page).to have_content('Isaac Asimov')
      expect(page).to have_content("Created At: #{author3.created_at}")
      expect(page).to_not have_content('Frank Herbert')
    end

    within '#index-1' do
      expect(page).to have_content('Frank Herbert')
      expect(page).to have_content("Created At: #{author2.created_at}")
      expect(page).to_not have_content('J.R.R. Tolkien')
    end

    within '#index-2' do
      expect(page).to have_content('J.R.R. Tolkien')
      expect(page).to have_content("Created At: #{author.created_at}")
      expect(page).to_not have_content('Isaac Asimov')
    end
  end
end
