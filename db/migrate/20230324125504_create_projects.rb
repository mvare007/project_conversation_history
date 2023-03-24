class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false, index: { unique: true }
      t.integer :status

      t.timestamps
    end
  end
end
