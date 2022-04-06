require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe Invoice, type: :model do
  before do
    DatabaseCleaner.clean
    user = User.create(id: 1, name: 'User', email: 'test6@test.com', password: 'test1234', password_confirmation: 'test1234')
    Category.create(id: 1, name: 'Foods', user: user, icon: fixture_file_upload(file_fixture('foods.png')))
  end

  it 'should have a name' do
    invoice = Invoice.new(name: nil, amount: 100, user_id: 1, category_id: 1)
    expect(invoice).to_not be_valid
  end

  it 'should have an amount' do
    invoice = Invoice.new(name: 'Food', amount: nil, user_id: 1, category_id: 1)
    expect(invoice).to_not be_valid
  end

  it 'should have an positive or zero amount' do
    invoice = Invoice.new(name: 'Food', amount: -10, user_id: 1, category_id: 1)
    expect(invoice).to_not be_valid
  end

  it 'should have at least 1 category' do
    invoice = Invoice.new(name: 'Food', amount: 100, user_id: 1, category_id: nil)
    expect(invoice).to_not be_valid
  end
end