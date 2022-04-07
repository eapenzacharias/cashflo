require 'rails_helper'
require 'capybara/rspec'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe 'Login' do
  before :each do
    DatabaseCleaner.clean
    User.create(id: 1, name: 'User', email: 'user1@test.com', password: 'test1234', password_confirmation: 'test1234')
  end

  describe 'When visiting log in page', type: :feature do
    before :each do
      visit '/signin'
    end
    it 'should have email field' do
      expect(page).to have_field('Email')
    end

    it 'should have password field' do
      expect(page).to have_field('Password')
    end

    it 'should have log in button' do
      expect(page).to have_button('Sign In')
    end
  end

  describe 'When clicking on log in button', type: :feature do
    before :each do
      visit '/signin'
    end

    it 'should flash error message when empty login details are submitted' do
      click_button 'Sign In'
      expect(page).to have_text('Invalid Email or password.')
    end

    it 'should flash error message when incorrect login details are submitted' do
      fill_in 'Email', with: 'a@a.com'
      fill_in 'Password', with: '987654321'
      click_button 'Sign In'
      expect(page).to have_text('Invalid Email or password.')
    end

    it 'should login when correct login details are submitted' do
      fill_in 'Email', with: 'user1@test.com'
      fill_in 'Password', with: 'test1234'
      click_button 'Sign In'
      expect(page).to have_text('Signed in successfully.')
      expect(page).to have_text('Categories')
    end
  end
end
