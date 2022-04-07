require 'rails_helper'
require 'capybara/rspec'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe 'Categories#index' do
  before :each do
    DatabaseCleaner.clean
    User.create(id: 1, name: 'User', email: 'user1@test.com', password: 'test1234', password_confirmation: 'test1234')
    Category.create(name: 'Foods', user_id: 1, icon: fixture_file_upload(file_fixture('foods.png')))
  end

  describe 'When visiting Categories#index page', type: :feature do
    before :each do
      visit '/signin'
      fill_in 'Email', with: 'user1@test.com'
      fill_in 'Password', with: 'test1234'
      click_button 'Sign In'
    end

    it 'should have heading Categories' do
      expect(page).to have_text('Categories')
    end
    it 'should have name of the category' do
      expect(page).to have_text('Foods')
    end
    it 'should have an icon' do
      expect(page).to have_css('img')
    end
  end
end
