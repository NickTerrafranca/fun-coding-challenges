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
puts flight1.flight_path
