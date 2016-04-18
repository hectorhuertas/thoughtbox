require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }

  it 'has read default to false' do
    link = Link.new

    expect(link.read).to be(false)
  end
end
