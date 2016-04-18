require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }

  it 'has read default to false' do
    link = Link.new

    expect(link.read).to be(false)
  end

  it 'accepts valid urls' do
    link = Link.new(title: 't', url: 'http://www.google.com')

    expect(link).to be_valid
  end

  it 'rejects invalid urls' do
    link = Link.new(title: 't', url: 'url')

    expect(link).to_not be_valid
  end

  it 'rejects empty urls' do
    link = Link.new(title: 't', url: '')

    expect(link).to_not be_valid
  end

  it 'require a url' do
    link = Link.new(title: 't')

    expect(link).to_not be_valid
  end
end
