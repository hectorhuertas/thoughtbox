require 'rails_helper'

RSpec.describe 'Authorization', type: :feature do
  context 'guest user' do
    context 'visits root page' do
      it 'is redirected to login page' do
        visit root_path

        expect(current_path).to eq(login_path)
      end
    end

    context 'visits login page' do
      it 'stays there' do
        visit login_path

        expect(current_path).to eq(login_path)
      end
    end

    context 'visits signup page' do
      it 'stays there' do
        visit signup_path

        expect(current_path).to eq(signup_path)
      end
    end

    context 'visits links page' do
      it 'is redirected to login page' do
        visit links_path

        expect(current_path).to eq(login_path)
      end
    end
  end
end
