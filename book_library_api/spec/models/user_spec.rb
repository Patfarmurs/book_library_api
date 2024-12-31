require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:loans) }
    it { should have_many(:shelves) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it do
      should allow_value('user@example.com').for(:email)
      should_not allow_value('user@invalid').for(:email)
    end
  end

  describe 'custom methods' do
    it "formats email to lowercase before saving" do
      user = User.create!(name: "Test User", email: "TEST@EXAMPLE.COM")
      expect(user.reload.email).to eq("test@example.com")
    end
  end
end
