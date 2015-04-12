require 'rspec'
require_relative 'flight_tracker'


RSpec.describe 'flight_tracker' do
  it 'sorts a reversed list of airports' do
    input = [['LAX', 'BWI'], ['HNL', 'LAX'], ['SEA', 'HNL'], ['BOS', 'SEA']]
    flight_one = FlightTracker.new(input)
    expect(flight_one.flight_plan).to eq([['BOS', 'SEA'], ['SEA', 'HNL'], ['HNL', 'LAX'], ['LAX', 'BWI']])
  end

  it 'sorts a unordered list of airports' do
    input = [['LAX', 'BWI'], ['BOS', 'SEA'], ['HNL', 'LAX'], ['SEA', 'HNL']]
    flight_one = FlightTracker.new(input)
    expect(flight_one.flight_plan).to eq([['BOS', 'SEA'], ['SEA', 'HNL'], ['HNL', 'LAX'], ['LAX', 'BWI']])
  end

  it 'sorts an ordered list of airports' do
    input = [['BOS', 'SEA'], ['SEA', 'HNL'], ['HNL', 'LAX'], ['LAX', 'BWI']]
    flight_one = FlightTracker.new(input)
    expect(flight_one.flight_plan).to eq([['BOS', 'SEA'], ['SEA', 'HNL'], ['HNL', 'LAX'], ['LAX', 'BWI']])
  end
end
