class DropTableUserTests < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_tests
  end
end