class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  #READ owners and apartments'

  get '/apartments' do
    apartment = Apartment.all 
    apartment.to_json 
  end

  get '/apartments/:id' do
    apartment = Apartment.find(params[:id])
    apartment.to_json
  end

  
  get '/owners' do
    owner = Owner.all
    owner.to_json
  end

  get '/owners/:id' do
    owner = Owner.find(params[:id])
    owner.to_json(include: :apartments)
  end

  get '/apartments/price/by_price' do 
# .by_price method defined in the Apartment class
    apartments = Apartment.by_price
    apartments.to_json
  end
  
  get '/apartments/rating/by_rating' do 
    # .by_rating method is defined in the Apartment class
    apartments = Apartment.by_rating
    apartments.to_json
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
      name: params[:name],
      price: params[:price],
      rating: params[:rating]

    )
    apartment.to_json
  end

  delete '/apartments/:id' do
    apartment = Apartment.find(params[:id])    # find the apartment using the ID
    apartment.destroy                           # delete the apartment
    apartment.to_json            # send a response with the deleted apartment as JSON 
  end
end
