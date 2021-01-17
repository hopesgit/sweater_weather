require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should have_secure_password}
    it { should validate_presence_of :api_key}
    it { should validate_uniqueness_of :api_key}
    it { should allow_value("mitch@foo.bar").for(:email)}
    it { should_not allow_value("mitch@foo").for(:email)}
    it { should validate_uniqueness_of :email}
  end

  describe 'test_factory' do
    it 'creates a valid object' do
      5.times do
        user = FactoryBot.create(:user)
        expect(user.valid?).to be true
      end
    end
  end
end
