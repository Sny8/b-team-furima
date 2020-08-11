class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null:false
      t.text :explanation, null: false
      t.integer :price, null:false
      t.string :brand
      t.references :user,null: false, foreign_key: true
      t.date :deal_finish_day, null: false

      t.timestamps
    end
  end
end


