100.times do
  address_book              = AddressBook.new
  address_book.first_name   = Faker::Name.name.split.first
  address_book.last_name    = Faker::Name.name.split.last
  address_book.country      = Faker::Address.country
  address_book.city         = Faker::Address.city
  address_book.address      = Faker::Address.street_address
  address_book.phone_number = Faker::PhoneNumber.cell_phone
  address_book.job_title    = Faker::Job.title
  address_book.email        = Faker::Internet.email

  if address_book.save
    pp "New entry added to address book"
  else
    pp address_book.errors.errors.full_messages
  end
end
