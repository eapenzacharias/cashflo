require 'capybara/rspec'

RSpec.describe 'Login' do
  before :each do
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
end