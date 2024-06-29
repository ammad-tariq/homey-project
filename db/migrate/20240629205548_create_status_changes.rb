class CreateStatusChanges < ActiveRecord::Migration[7.1]
  def change
    create_table :status_changes do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :from_status
      t.integer :to_status

      t.timestamps
    end
  end
end
