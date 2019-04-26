class HotelPicker
  class Hotel

    CustomerType = {
      :regular => 'Regular',
      :rewards => 'Rewards'
    }

    attr_accessor :name, :rating,
      :regular_weekday_rates,
      :rewards_weekday_rates,
      :regular_weekend_rates,
      :rewards_weekend_rates

  end
end
