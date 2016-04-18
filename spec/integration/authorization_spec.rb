require 'rails_helper'

RSpec.describe 'Authorization' do
  context 'guest user' do
    context 'visits root page' do
      it 'is redirected to login page' do
        visit root_path

        expect(current_path).to eq(login_path)
      end
    end
  end
end
