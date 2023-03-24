class CreateStatusTransition < ActiveRecord::Migration[7.0]
  def change
    create_table :status_transitions do |t|
      t.string :previous_status, null: false
      t.string :new_status, null: false
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
