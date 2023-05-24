# This is just a way to fill the DB wit test Data.

3.times do
	Product.create({
		name: Faker::Book.title
	})
end