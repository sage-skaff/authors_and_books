require 'rails_helper'

RSpec.describe 'New Authors Page' do
  it 'links to the new page from the authors index' do
    visit '/authors'

    click_link 'New Author'
    expect(current_path).to eq('/authors/new')
  end

  it 'has form to create new author' do
    visit '/authors/new'

    fill_in('Name', with: 'Isaac Asimov')
    fill_in('Age', with: '72')
    fill_in('Living', with: 'false')

    click_button 'Create Author'

    expect(current_path).to eq('/authors')
    expect(page).to have_content('Isaac Asimov')
  end
end
