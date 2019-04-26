class HotelPicker
  class DayRent

    def initialize(hotel, customer_type, date)
      @hotel = hotel
      @customer_type = customer_type
      @date = date
    end

    def rates
      @rates ||= if rewards?
        if weekend?
          @hotel.rewards_weekend_rates
        else
          @hotel.rewards_weekday_rates
        end
      else
        if weekend?
          @hotel.regular_weekend_rates
        else
          @hotel.regular_weekday_rates
        end
      end
    end

    def weekend?
      @date.cwday > 5
    end

    def rewards?
      @customer_type == Hotel::CustomerType[:rewards]
    end
  end
end
