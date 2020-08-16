class AddColumnToProducts < ActiveRecord::Migration[5.2]
  add_column :products, :condition_id, :integer, default: 0
  add_column :products, :expection_day_id, :integer, default: 0
  add_column :products, :postage_payer_id, :integer, default: 0
  add_column :products, :status_id, :integer, default: 0
  def change  
  end
end
