require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'User', email: 'test6@test.com', password: 'test1234', password_confirmation: 'test1234')
  end

  before do
    DatabaseCleaner.clean
    subject.save
  end

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'should have password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
