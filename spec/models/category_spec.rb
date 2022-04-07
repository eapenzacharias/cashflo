require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe Category, type: :model do
  user = User.create(id: 1, name: 'User', email: 'user1@test.com', password: 'test1234', password_confirmation: 'test1234')

  before do
    DatabaseCleaner.clean
  end

  it 'should have a name' do
    category = Category.new(name: nil, user: user, icon: fixture_file_upload(file_fixture('foods.png')))
    expect(category).to_not be_valid
  end

  it 'should have a unique name' do
    Category.create(name: 'Foods', user: user, icon: fixture_file_upload(file_fixture('foods.png')))
    category = Category.new(name: 'Foods', user: user, icon: fixture_file_upload(file_fixture('foods.png')))
    expect(category).to_not be_valid
  end

  it 'should have an icon' do
    category = Category.new(name: 'Foods', user: user)
    expect(category).to_not be_valid
  end
end
