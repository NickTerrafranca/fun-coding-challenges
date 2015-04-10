# This sorts an array of airport codes in a way that would simulate a aircrafts flight path between multiple cities.
# For example given an array [['LAX', 'BWI'], ['HNL', 'LAX'], ['SEA', 'HNL'], ['BOS', 'SEA']] where the first index of each sub array is the
# departing airport and the second is the destination airport, the flight_path method would return [['BOS', 'SEA'], ['SEA', 'HNL'], ['HNL', 'LAX'], ['LAX', 'BWI']]

class FlightTracker

  attr_reader :list, :start_point, :flight_path

  def initialize(list)
    @list = list
    @start_point = find_start_point
    @flight_path = calculate_flight_path
  end

  def find_start_point
    start_point = nil
    @list.each do |a|
      @list.each do |b|
        if a[0] != b[1]
          start_point = @list.index(a)
        end
      end
    end
    start_point
  end

  def calculate_flight_path
    flight_path = [] << @list[@start_point]
    start = @start_point
    until flight_path.size == @list.size
      @list.each do |i|
        if @list[start][1] == i[0]
          flight_path << i
          start = @list.index(i)
        end
      end
    end
    flight_path
  end

end

flights = [['LAX', 'BWI'], ['HNL', 'LAX'], ['SEA', 'HNL'], ['BOS', 'SEA']]
flight1 = FlightTracker.new(flights)
p flight1.list
p flight1.start_point
p flight1.flight_path
