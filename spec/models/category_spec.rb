require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe Category, type: :model do
  before do
    DatabaseCleaner.clean
    User.create(id: 1, name: 'User', email: 'user1@test.com', password: 'test1234',
      password_confirmation: 'test1234')
  end

  it 'should have a name' do
    category = Category.new(name: nil, user_id: 1, icon: fixture_file_upload(file_fixture('foods.png')))
    expect(category).to_not be_valid
  end

  it 'should have a unique name' do
    Category.create(name: 'Foods', user_id: 1, icon: fixture_file_upload(file_fixture('foods.png')))
    category = Category.new(name: 'Foods', user_id: 1, icon: fixture_file_upload(file_fixture('foods.png')))
    expect(category).to_not be_valid
  end

  it 'should have an icon' do
    category = Category.new(name: 'Foods', user_id: 1)
    expect(category).to_not be_valid
  end
end
