class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: -1 }

  default_scope { order(created_at: :desc) }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :high, -> { where(level: 5..Float::INFINITY) }
  scope :category_desc, ->(title) { joins(:category).where(categories: { title: title }).order(title: :desc) }
end
