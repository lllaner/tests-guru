class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_and_belongs_to_many :users
  belongs_to :author, class_name: "User" , foreign_key: "author_id"
  class << self
    def category_desc(title)
      Test.joins('INNER JOIN categories ON tests.category_id = categories.id').where('categories.title' => title).order(title: :desc)
    end
  end
end
