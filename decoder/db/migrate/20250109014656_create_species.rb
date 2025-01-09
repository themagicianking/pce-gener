class CreateSpecies < ActiveRecord::Migration[8.0]
  def change
    create_table :species do |t|
      t.string :name
      t.string :allele_1
      t.string :allele_2

      t.timestamps
    end
  end
end
