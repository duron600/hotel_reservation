require 'date'

require 'hotel_picker/day_rent'
require 'hotel_picker/hotel'
require 'hotel_picker/rent'
require 'hotel_picker/state_error'

class HotelPicker
  
  def initialize(customer_type, *dates)
    @customer_type = customer_type
    @dates = dates
    @hotels = []
  end

  def add_hotel(hotel)
    @hotels << hotel
  end

  def rents
    @hotels.map{|hotel| Rent.new hotel, @customer_type, @dates }
  end

  def pick
    raise StateError.new('No hotel to pick, add some hotel first.') if @hotels.empty?
    cheapest.max{|rent| rent.hotel_rating}.hotel_name
  end

  private

  def cheapest
    Cheapest.new(rents).select
  end

  class Cheapest

    def initialize(rents)
      @rents = rents
      @result = []
    end

    def select
      @rents.each do |rent|
        if cheapest? rent
          @result = [rent]
        elsif same_with_cheapest? rent
          @result << rent
        end
      end
      @result
    end

    def cheapest?(rent)
      @result.empty? || @result.last.rates > rent.rates
    end

    def same_with_cheapest?(rent)
      @result.last.rates == rent.rates
    end
  end
end
