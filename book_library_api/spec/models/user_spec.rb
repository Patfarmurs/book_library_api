require 'rails_helper'

RSpec.describe User, type: :model do
  # Validation tests
  it 'is valid with a name and email' do
    user = User.new(name: 'Patrick', email: 'patrick@example.com')
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(name: nil, email: 'patrick@example.com')
    expect(user).to_not be_valid
  end

  it 'is invalid without an email' do
    user = User.new(name: 'Patrick', email: nil)
    expect(user).to_not be_valid
  end

  it 'is invalid with a duplicate email' do
    User.create!(name: 'Patrick', email: 'patrick@example.com')
    duplicate_user = User.new(name: 'John', email: 'patrick@example.com')
    expect(duplicate_user).to_not be_valid
  end
end
