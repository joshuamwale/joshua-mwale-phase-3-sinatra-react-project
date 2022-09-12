puts "🌱 Seeding data..."

# Seed your database here
# run a loop 10 times

10.times do 
  # create an owner with random data
  owner = Owner.create(
    name: Faker::Name.name,
    age: Faker::Number.number(digits: 35),
    hometown: Faker::Nation.capital_city
  )
end

        #create between 1 and 40 apartments for each owner
        rand(1..40).times do 
            Apartment.create(
            name: Faker::Restaurant.name,
            location: Faker::Nation.capital_city,
            price: rand(100..200), # random number between 100 and 200
            rating: rand(1..10),
            owner_id: rand(1..10) #use the primary key of the owner as the foreign key
          )
        end
puts "✅ Done seeding!"
