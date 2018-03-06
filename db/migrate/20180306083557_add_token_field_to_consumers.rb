class AddTokenFieldToConsumers < ActiveRecord::Migration[5.1]
  def change
    add_column :consumers, :token, :string
    remove_column :consumers, :public_key
  end
end
