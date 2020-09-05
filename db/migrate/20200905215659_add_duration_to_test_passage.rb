class AddDurationToTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :duration, :integer
    add_column :tests, :timer_enabled, :boolean, default: false
  end
end
