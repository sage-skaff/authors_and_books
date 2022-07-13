require 'rails_helper'

RSpec.describe 'Edit Authors Page' do
  it 'links to the new page from the authors index' do
    author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)

    visit "/authors/#{author.id}"

    click_link 'Update Author'
    expect(current_path).to eq("/authors/#{author.id}/edit")
  end

  it 'has form to edit author' do
    author = Author.create!(name: 'J.R.R. Tolkien', age: 81, living: false)

    visit "/authors/#{author.id}/edit"

    fill_in('Name', with: 'Isaac Asimov')
    fill_in('Age', with: '72')
    fill_in('Living', with: 'false')

    click_button 'Update Author'

    expect(current_path).to eq("/authors/#{author.id}")
    expect(page).to have_content('Isaac Asimov')
    expect(page).to_not have_content('J.R.R. Tolkien')
  end
end
