class CreateGrowths < ActiveRecord::Migration[8.0]
  def change
    create_table :growths do |t|
      t.string :allele_1
      t.string :allele_2

      t.timestamps
    end
  end
end
