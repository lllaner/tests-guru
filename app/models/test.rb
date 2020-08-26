class Test < ApplicationRecord
  has_many :questions, dependent: :delete_all
  belongs_to :category
  has_many :test_passages, dependent: :delete_all
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  default_scope { order(created_at: :desc) }

  scope :difficulty, ->(range) { where(level: range) }
  scope :easy, -> { difficulty(0..1) }
  scope :middle, -> { difficulty(2..4) }
  scope :high, -> { difficulty(5..Float::INFINITY) }
  scope :get_category, ->(title) { joins(:category).where(categories: { title: title }) }

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: -1 }

  class << self
    def category_desc(title)
      get_category(title).order(title: :desc).pluck(:title)
    end
  end
end
