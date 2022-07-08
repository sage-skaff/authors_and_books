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
end
