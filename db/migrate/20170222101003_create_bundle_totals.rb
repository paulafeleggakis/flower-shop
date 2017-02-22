class CreateBundleTotals < ActiveRecord::Migration[5.0]
  def change
    create_table :bundle_totals do |t|
      t.integer :bundle_quantity
      t.integer :bundle_size
      t.float :bundle_cost
      t.belongs_to :line_item, foreign_key: true

      t.timestamps
    end
  end
end
