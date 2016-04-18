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
          expect(page).to have_text('Invalid Link')
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
          expect(page).to have_text('Invalid Link')
        end
      end
    end

    context 'marks link as read' do
      it 'updates the link' do
        link = Link.create(title: 'title', url: 'http://www.google.com')
        visit links_path
        click_on 'Mark as Read'

        link.reload
        expect(link.read).to be(true)
        expect(page).to have_text('Mark as Unread')
      end
    end

    context 'marks link as unread' do
      it 'updates the link' do
        link = Link.create(title: 'title', url: 'http://www.google.com', read: true)

        visit links_path
        click_on 'Mark as Unread'

        link.reload
        expect(link.read).to be(false)
        expect(page).to have_text('Mark as Read')
      end
    end

    context 'edits a link' do
      context 'with valid data' do
        it 'updates the link' do
          old_link = Link.create(title: 'old_link', url: 'http://www.boogle.com')
          link = Link.new(title: 'new_link', url: 'http://www.google.com')
          visit links_path
          click_on 'Edit'

          expect(current_path).to eq(edit_link_path(old_link))

          fill_in 'link[title]', with: link.title
          fill_in 'link[url]', with: link.url
          click_on 'Submit Link'

          expect(current_path).to eq(links_path)
          expect(page).to have_text(link.title)
          expect(page).to have_text(link.url)
        end
      end
    end
  end
end
