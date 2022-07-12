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

  it 'has links for authors index and books index' do
    visit '/authors'

    expect(page).to have_link('Authors Index')
    expect(page).to have_link('Books Index')
  end
  # User Story 11, Parent Creation

  # As a visitor
  # When I visit the Parent Index page
  # Then I see a link to create a new Parent record, "New Parent"
  # When I click this link
  # Then I am taken to '/parents/new' where I  see a form for a new parent record
  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.
  it 'has link to create new author' do
    visit '/authors'

    expect(page).to have_link('New Author')
    click_link 'New Author'
    expect(current_path).to eq('/authors/new')
  end
end
