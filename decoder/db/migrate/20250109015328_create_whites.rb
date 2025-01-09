class CreateWhites < ActiveRecord::Migration[8.0]
  def change
    create_table :whites do |t|
      t.string :name
      t.string :visible_allele_1
      t.string :visible_allele_2
      t.string :level_allele
      t.string :type_allele

      t.timestamps
    end
  end
end
