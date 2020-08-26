class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :email
      t.string :message

      t.timestamps
    end

    add_column :tests, :ready, :boolean, default: false
  end
end
