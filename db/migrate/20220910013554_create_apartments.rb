class CreateApartments < ActiveRecord::Migration[6.1]
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :location
      t.integer :price
      t.integer :rating
      t.integer :owner_id # this is the foreign key
      t.timestamps  
    end
  end
end