class CreateMallProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :mall_products do |t|
      t.references :mall, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
