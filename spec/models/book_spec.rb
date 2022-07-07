require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :pages }
    it { should allow_value(true).for(:series) }
    it { should allow_value(false).for(:series) }
  end
end
