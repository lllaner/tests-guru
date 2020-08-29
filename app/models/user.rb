class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :my_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :test_passages
  has_many :gists
  has_many :badge_users
  has_many :tests, through: :test_passages
  has_many :badges, through: :badge_users

  def test_passege(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def level_test(level)
    tests.where(level: level)
  end

  def count_own_badges
    badges = []
    self.badges.group_by(&:id).each do |id, group|
      badges << { badge: Badge.find(id), count: group.size }
    end
    badges
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
