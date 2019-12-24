class CreateUserTests < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tests do |t|

      t.timestamps
    end
  end
end
