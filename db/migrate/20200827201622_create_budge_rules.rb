class CreateBudgeRules < ActiveRecord::Migration[6.0]
  def change
    create_table :badge_rules do |t|
      t.string :logic, null: false

      t.timestamps
    end
    add_reference :badges, :badge_rule, foreign_key: true
  end
end
