class AddPositionToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :position, :integer, default: 0
  end
end
