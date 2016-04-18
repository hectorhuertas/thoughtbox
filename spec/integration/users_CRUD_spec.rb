require 'rails_helper'

RSpec.describe 'Users CRUD', type: :feature do
  context 'New user' do
    context 'with valid data' do
      it 'registers succesfully' do
        user = User.new(email: 'email', password: 'pass')
        visit signup_path

        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        fill_in 'user[password_confirmation]', with: user.password
        click_on 'Register'

        expect(User.count).to eq(1)
        expect(current_path).to eq(links_path)
        expect(page).to have_text(user.email)
      end
    end
  end
end
