class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.text :description
      t.references :owner_id, null: false, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
