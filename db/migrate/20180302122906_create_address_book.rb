class CreateAddressBook < ActiveRecord::Migration[5.1]
  def change
    create_table :address_books do |t|
      t.string :address
      t.string :city
      t.string :country
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :job_title
    end
  end
end
