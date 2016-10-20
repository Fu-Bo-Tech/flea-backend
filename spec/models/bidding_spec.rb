require 'rails_helper'

describe Bidding do
  let(:start_time) { DateTime.new(2016, 10, 12, 9) }
  let(:end_time) { DateTime.new(2016, 10, 12, 18) }
  let(:event) { Event.create!(title: 'demo', start_time: start_time, end_time: end_time) }
  let(:alice) { User.create!(email: 'alice@hopebaytech.com', name: 'Alice', password: '12345678', nickname: 'Alice') }
  let(:bob) { User.create!(email: 'bob@hopebaytech.com', name: 'Bob', password: '12345678', nickname: 'Bob') }
  let(:car) { Good.create!(title: 'car', description: 'super faster', owner: alice, event: event) }
  after(:each) { Timecop.return }
  describe 'create' do
    context 'successful' do
      context 'near the end of bidding' do

        it 'extend the bidding time for 3 minutes' do
          Timecop.travel(end_time - 2.minutes)
          expect(car.bidding_time).to eq(end_time)

          Bidding.create!(user: bob, good: car, amount: 10)
          car.reload
          expect(car.bidding_time).to eq(end_time + 3.minutes)
          expect(car.extended_count).to eq(1)
        end

        context 'in 1st extended time period' do
          it 'extend the bidding time for 3 minutes' do
            Timecop.travel(end_time + 1.minute)
            car.update!(bidding_time: car.bidding_time + 3.minutes, extended_count: 1)
            Bidding.create!(user: bob, good: car, amount: 10)

            car.reload
            expect(car.bidding_time).to eq(end_time + 3.minutes + 3.minutes)
            expect(car.extended_count).to eq(2)
          end
        end

        context 'in 3rd extended time period' do
          it 'extend the bidding time for 1 minutes' do
            Timecop.travel(end_time + 8.minutes)
            car.update!(bidding_time: car.bidding_time + 9.minutes, extended_count: 3)
            Bidding.create!(user: bob, good: car, amount: 10)

            car.reload
            expect(car.bidding_time).to eq(end_time + 10.minutes)
            expect(car.extended_count).to eq(4)
          end
        end
      end

      context 'failure' do
        it 'adds errors, when bidding amount dose not over 1 NTD' do
          Timecop.travel(start_time)
          Bidding.create!(user: bob, good: car, amount: 10)
          expect { Bidding.create!(user: bob, good: car, amount: 10) }.to raise_error(ActiveRecord::RecordInvalid, /amount/i)
        end

        it 'adds errors, when over bidding time' do
          Timecop.travel(end_time + 1.second)
          expect { Bidding.create!(user: bob, good: car, amount: 10) }.to raise_error(ActiveRecord::RecordInvalid)
        end

        context 'extended period' do
          it 'adds errors, when bidding amount dose not over 10 NTD' do
            Timecop.travel(end_time + 8.minutes)
            car.update!(bidding_time: car.bidding_time + 9.minutes, extended_count: 3)
            Bidding.create!(user: bob, good: car, amount: 10)

            expect { Bidding.create!(user: bob, good: car, amount: 15) }.to raise_error(ActiveRecord::RecordInvalid, /amount/i)
          end
        end
      end
    end
  end
end
