class CreateOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :age 
      t.string :hometown
      #the id column will be generated automatically for every owner
      t.timestamps
    end
  end
end
