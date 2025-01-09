class CreateColors < ActiveRecord::Migration[8.0]
  def change
    create_table :colors do |t|
      t.string :name
      t.string :o_and_b_allele_1
      t.string :o_and_b_allele_2
      t.string :dilute_allele_1
      t.string :dilute_allele_2
      t.string :density_allele

      t.timestamps
    end
  end
end
