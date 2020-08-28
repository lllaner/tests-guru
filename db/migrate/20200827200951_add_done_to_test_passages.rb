class AddDoneToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :done, :boolean, default: false
  end
end
