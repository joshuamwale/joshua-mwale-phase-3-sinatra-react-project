puts "🌱 Seeding data..."

# Seed your database here
# run a loop 10 times

10.times do 
  # create an owner with random data
  owner = Owner.create(
    name: Faker::Owner.name,
    age: Faker::Owner.age,
    hometown: Faker::Owner.hometown
  )

        #create between 1 and 5 apartments for each owner
        rand(1..5).times do 
            Apartment.create(
            name: Faker::Apartment.name,
            location: Faker::Apartment.location,
            price: rand(100..200), # random number between 100 and 200
            owner_id: owner.id # use the primary key of the owner as the foreign key
          )
    end
end

puts "✅ Done seeding!"
