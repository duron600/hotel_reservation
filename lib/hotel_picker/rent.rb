class HotelPicker
  class Rent
    
    def initialize(hotel, customer_type, dates)
      @hotel = hotel
      @day_rents = dates.map do |date|
        DayRent.new hotel, customer_type, date
      end
    end

    def rates
      @day_rents.inject(0){|result, rent| result += rent.rates }
    end

    def hotel_rating
      @hotel.rating
    end

    def hotel_name
      @hotel.name
    end
  end
end
