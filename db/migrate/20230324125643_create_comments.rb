class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :author, null: false
      t.text :content, null: false
      t.references :project, null: false, foreign_key: true
      t.boolean :edited

      t.timestamps
    end
  end
end
