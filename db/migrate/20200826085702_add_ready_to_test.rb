class AddReadyToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :ready, :boolean, default: false
  end
end
