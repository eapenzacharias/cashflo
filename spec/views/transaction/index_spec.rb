require 'rails_helper'
require 'capybara/rspec'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe 'Transactions#index' do
  before :each do
    DatabaseCleaner.clean
    User.create(id: 1, name: 'User', email: 'user1@test.com', password: 'test1234', password_confirmation: 'test1234')
    Category.create(id: 1, name: 'Foods', user_id: 1, icon: fixture_file_upload(file_fixture('foods.png')))
    Invoice.create(name: 'KFC', amount: 99.9, user_id: 1, category_id: 1)
    Invoice.create(name: 'MacD', amount: 30, user_id: 1, category_id: 1)
  end

  describe 'When visiting Categories#index page', type: :feature do
    before :each do
      visit '/signin'
      fill_in 'Email', with: 'user1@test.com'
      fill_in 'Password', with: 'test1234'
      click_button 'Sign In'
      visit '/categories/1'
    end

    it 'should have heading Category Name' do
      expect(page).to have_text('Foods')
    end
    it 'should have name all transaction names' do
      expect(page).to have_text('KFC')
      expect(page).to have_text('MacD')
    end
    it 'should have category icon' do
      expect(page).to have_css('img')
    end
    it 'should have Data Panel with total amounts' do
      expect(page).to have_text('Total Spend')
      expect(page).to have_text('$129.9')
      expect(page).to have_text('Last 30 Days')
    end
  end
end
