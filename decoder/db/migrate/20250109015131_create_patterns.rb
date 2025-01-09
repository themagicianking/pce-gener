class CreatePatterns < ActiveRecord::Migration[8.0]
  def change
    create_table :patterns do |t|
      t.string :name
      t.string :visible_allele_1
      t.string :visible_allele_2
      t.string :type_allele_1
      t.string :type_allele_2

      t.timestamps
    end
  end
end
