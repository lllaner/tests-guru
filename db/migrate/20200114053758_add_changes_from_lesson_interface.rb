class AddChangesFromLessonInterface < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string, default: '', null: false
    add_index :tests, :title, unique: true
  end
end
