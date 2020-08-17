class AddImagephotoToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :imagephoto, :string
  end
end
