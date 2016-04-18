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
end
