require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should allow_value(true).for(:living) }
    it { should allow_value(false).for(:living) }
  end

  describe 'relationships' do
    it { should have_many :books }
  end
end
