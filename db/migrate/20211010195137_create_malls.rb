class CreateMalls < ActiveRecord::Migration[6.1]
  def change
    create_table :malls do |t|
      t.string :name
      t.string :city
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
