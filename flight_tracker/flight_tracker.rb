# This sorts an array of airport codes in a way that would simulate an aircrafts flight path between multiple cities.
# For example: Given an array [['LAX', 'BWI'], ['HNL', 'LAX'], ['SEA', 'HNL'], ['BOS', 'SEA']] where the first index of each sub array is the
# departing airport and the second is the destination airport, the flight_path method would return [['BOS', 'SEA'], ['SEA', 'HNL'], ['HNL', 'LAX'], ['LAX', 'BWI']].

class FlightTracker
  attr_reader :list, :flight_plan
  def initialize(list)
    @list = list
    @start_point = find_start_point
    @flight_plan = sort_flight_path
  end

  def find_start_point
    @list.each_with_index do |sub, idx|
      return idx if @list.flatten.count(sub[0]) == 1
    end
  end

  def sort_flight_path
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
