require 'spec_helper'

describe HotelPicker do

  before do
    @hotel_picker = HotelPicker.new('Regular', Date.new)
  end

  describe '#pick' do

    context 'with no hotel' do
      it 'raise StateError' do
        expect {@hotel_picker.pick}.to raise_error(HotelPicker::StateError)
      end
    end

    context 'with two same rating hotel' do
      before do
        @hotel = FactoryGirl.build :hotel
        @cheapest_hotel = FactoryGirl.build :cheapest_hotel
        @hotel_picker.add_hotel @hotel
        @hotel_picker.add_hotel @cheapest_hotel
      end

      it 'returns the cheapest hotel' do
        expect(@hotel_picker.pick).to be @cheapest_hotel.name
      end
    end

    context 'in case of a tie' do
      before do
        @hotel = FactoryGirl.build :hotel
        @higher_rating_hotel = FactoryGirl.build :higher_rating_hotel
        @hotel_picker.add_hotel @hotel
        @hotel_picker.add_hotel @higher_rating_hotel
      end

      it 'returns the hotel with highest rating' do
        expect(@hotel_picker.pick).to be @higher_rating_hotel.name
      end
    end
  end
end
