class AddCorrectToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :correct, :boolean
  end
end
