class Apartment < ActiveRecord::Base 
    belongs_to :owner


    def self.by_price
        self.all.order(price: :desc)
    end

    def self.by_rating 
        self.all.order(rating: :desc)
    end
end