require 'rails_helper'

RSpec.describe 'Authors Index Page' do
  it 'lists names of all the authors' do
    author = Author.create!(name: 'John Green', age: 44, living: true)
    author2 = Author.create!(name: 'Isaac Asimov', age: 72, living: false)

    visit '/authors'
    expect(page).to have_content('John Green')
    expect(page).to have_content('Isaac Asimov')
  end
end
