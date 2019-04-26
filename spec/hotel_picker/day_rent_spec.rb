require 'spec_helper'

class HotelPicker
  describe DayRent do
    before do
      @hotel = FactoryGirl.build :hotel
    end

    describe '#rates' do
      context 'with regular customer on weekday' do
        before do
          monday = Date.parse '26Aug2013'
          @day_rent = DayRent.new @hotel, Hotel::CustomerType[:regular], monday
        end

        it 'returns the weekday rates for regular customer' do
          expect(@day_rent.rates).to be @hotel.regular_weekday_rates
        end
      end

      context 'with regular customer on weekend' do
        before do
          sunday = Date.parse '25Aug2013'
          @day_rent = DayRent.new @hotel, Hotel::CustomerType[:regular], sunday
        end

        it 'returns the weekday rates for regular customer' do
          expect(@day_rent.rates).to be @hotel.regular_weekend_rates
        end
      end

      context 'with rewards customer on weekday' do
        before do
          monday = Date.parse '26Aug2013'
          @day_rent = DayRent.new @hotel, Hotel::CustomerType[:rewards], monday
        end

        it 'returns the weekday rates for regular customer' do
          expect(@day_rent.rates).to be @hotel.rewards_weekday_rates
        end
      end

      context 'with rewards customer on weekend' do
        before do
          sunday = Date.parse '25Aug2013'
          @day_rent = DayRent.new @hotel, Hotel::CustomerType[:rewards], sunday
        end

        it 'returns the weekday rates for regular customer' do
          expect(@day_rent.rates).to be @hotel.rewards_weekend_rates
        end
      end
    end
  end
end
