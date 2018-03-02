class AddFieldsToConsumer < ActiveRecord::Migration[5.1]
  def change
    add_column :consumers, :public_key, :text
    add_column :consumers, :secret, :string
  end
end
