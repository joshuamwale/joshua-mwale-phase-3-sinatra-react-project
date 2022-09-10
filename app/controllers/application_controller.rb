class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  #READ owners and apartments
  get '/owners' do
    owners = Owner.all
    owners.to_json
  end

  get '/owners/:id' do
    owner = Owner.find(params[:id])
    owner.to_json(include: :apartments)
  end

  get '/apartments/by_price' do 
# .by_price method defined in the Apartment class
    apartments = Apartment.by_price
    apartments.to_json
  end

  get '/apartments/most_expensive' do 
    # .by_price method defined in the Apartment class
    apartments = Apartment.by_price.first 
    apartment.to_json 
  end

  get '/apartments/by_rating' do 
    # .by_rating method is defined in the Apartment class
    apartments = Apartment.by_rating
    apartments.to_json
  end

  get '/apartments/most_expensive' do 
    apartment = Apartment.by_rating.first
    apartment.to_json 
  end


  #CREATING new apartments
  post '/apartments' do
    apartment = Apartment.create(
      name: params[:name],
      location: params[:location],
      price: params[:price],
      rating: params[:rating],
      owner_id: params[:owner_id]
    )
    apartment.to_json
  end
      #params used to create a new apartment 
      # t.string :name
      # t.string :location
      # t.integer :price
      # t.integer :rating
      # t.integer :owner_id


      #UPDATE the apartments' details
  
  patch '/apartments/:id' do
    apartment = Apartment.find(params[:id])
    apartment.update(
      price: params[:price],
      rating: params[:rating]
    )
    apartment.to_json
  end
end
