require 'rails_helper'

RSpec.describe 'Authentication', type: :feature do
  context 'unregistered user' do
    context 'visits login page' do
      it 'can go to signup page' do
        visit login_path

        expect(page).to have_link('Sign Up', signup_path)
      end
    end
  end

  context 'registered but unauthenticated user' do
    context 'visits login page' do
      it 'can log in' do
        user = User.create(email: 'email', password: 'pass')
        visit login_path

        fill_in 'session[email]', with: user.email
        fill_in 'session[password]', with: user.password
        click_on 'Log In'

        expect(current_path).to eq(links_path)
        expect(page).to have_text(user.email)
      end
    end
  end
end
