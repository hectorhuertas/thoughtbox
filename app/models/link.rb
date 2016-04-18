class Link < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :url, url: true
end
