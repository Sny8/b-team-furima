class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :condition_id, :integer, null: false
    add_column :products, :expection_day_id, :integer, null: false
    add_column :products, :postage_payer_id, :integer, null:false
    add_column :products, :status_id, :integer, null:false
  end
end
