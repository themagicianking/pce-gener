class CreateCats < ActiveRecord::Migration[8.0]
  def change
    create_table :cats do |t|
      t.string :species
      t.string :wind
      t.string :fur
      t.string :color
      t.string :pattern
      t.string :white_marks
      t.boolean :adult
      t.integer :genome

      t.timestamps
    end
  end
end
