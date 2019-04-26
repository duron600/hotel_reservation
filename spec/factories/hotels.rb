class HotelPicker
  FactoryGirl.define do
    factory :hotel, :class => Hotel do
      name 'Lakewood'
      rating 3
      regular_weekday_rates 200
      regular_weekend_rates 150
      rewards_weekday_rates 180
      rewards_weekend_rates 120
    end

    factory :cheapest_hotel, :class => Hotel do
      name 'Bridgewood'
      rating 3
      regular_weekday_rates 180
      regular_weekend_rates 130
      rewards_weekday_rates 150
      rewards_weekend_rates 100
    end

    factory :higher_rating_hotel, :class => Hotel do
      name 'Ridgewood'
      rating 5
      regular_weekday_rates 200
      regular_weekend_rates 150
      rewards_weekday_rates 180
      rewards_weekend_rates 120
    end
  end
end
