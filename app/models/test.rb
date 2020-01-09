class Test < ApplicationRecord
  class << self
    def category_desc(title)
      Test.joins('INNER JOIN categories ON tests.category_id = categories.id').where('categories.title' => title).order(title: :desc)
    end
  end
end
