require 'rails_helper'

RSpec.describe 'Links CRUD', type: :feature do
  context 'Authenticated user' do
    before(:each) do
      user = User.new(email: 'email', password: 'pass')
      allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
    end

    context 'submits a link' do
      context 'with valid data' do
        it 'saves to the database' do
          old_link = Link.create(title: 'old_link', url: 'http://www.boogle.com')
          link = Link.new(title: 'new_link', url: 'http://www.google.com')
          visit links_path

          fill_in 'link[title]', with: link.title
          fill_in 'link[url]', with: link.url
          click_on 'Submit Link'

          expect(Link.count).to eq(2)
          expect(page).to have_text(link.title)
          expect(page).to have_text(link.url)
          expect(page).to have_text(old_link.title)
          expect(page).to have_text(old_link.url)
        end
      end

      context 'with invalid title' do
        it 'shows an error' do
          link = Link.new(title: '', url: 'http://www.google.com')
          visit links_path

          fill_in 'link[title]', with: link.title
          fill_in 'link[url]', with: link.url
          click_on 'Submit Link'

          expect(Link.count).to eq(0)
          expect(page).to_not have_text(link.url)
          expect(page).to have_text('Invalid Title')
        end
      end

      context 'with invalid url' do
        it 'shows an error' do
          link = Link.new(title: 'title', url: 'url')
          visit links_path

          fill_in 'link[title]', with: link.title
          fill_in 'link[url]', with: link.url
          click_on 'Submit Link'

          expect(Link.count).to eq(0)
          expect(page).to_not have_text(link.title)
          expect(page).to_not have_text(link.url)
          expect(page).to have_text('Invalid Url')
        end
      end
    end
  end
end
