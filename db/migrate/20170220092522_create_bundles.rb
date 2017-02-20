class CreateBundles < ActiveRecord::Migration[5.0]
  def change
    create_table :bundles do |t|
      t.integer :bundle_quantity
      t.float :bundle_cost
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
