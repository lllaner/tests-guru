class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :url, presence: true

  GIST_URL = 'https://gist.github.com/'.freeze

  def full_url
    GIST_URL + url
  end
end
