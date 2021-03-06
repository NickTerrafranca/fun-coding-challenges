require 'rspec'
require_relative 'bubble_sort'

describe 'bubble_sort' do
  it 'sorts an unordered array of positive integers' do
    input = [3, 7, 5, 6, 4, 0, 1, 2, 9, 8]

    expect(bubble_sort(input)).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'returns the array when passed an already ordered array' do
    input = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    expect(bubble_sort(input)).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'sorts a worst-case scenario reversed array' do
    input = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]

    expect(bubble_sort(input)).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'sorts an unordered array with negative numbers' do
    input = [-13, 589, 11, 1001, 0, 27, 36, 92, 7, -2]

    expect(bubble_sort(input)).to eq([-13, -2, 0, 7, 11, 27, 36, 92, 589, 1001])
  end

  it 'sorts an array of strings' do
    input = ['a', 'z', 'A', 'Robert', 'nick', 'total noob']

    expect(bubble_sort(input)).to eq(['A', 'Robert', 'a', 'nick', 'total noob', 'z'])
  end

  it 'sorts an array of floats and integers' do
    input = [3, 9, 7, 0.1, 5, 6, 4, 0, 1.1, 1, 2, 9.3, 8]

    expect(bubble_sort(input)).to eq([0, 0.1, 1, 1.1, 2, 3, 4, 5, 6, 7, 8, 9, 9.3])
  end

  it 'returns [] if an empty array is passed' do
    input = []

    expect(bubble_sort(input)).to eq([])
  end

  it 'sorts an array containing duplicate values' do
    input = [-1, 3, 2, 1, 1, 2, 3, -1]

    expect(bubble_sort(input)).to eq([-1, -1, 1, 1, 2, 2, 3, 3])
  end

  it 'sorts an array of two elements' do
    input = [2, 1]

    expect(bubble_sort(input)).to eq([1, 2])
  end

  it 'sorts an array of 1 element' do
    input = [10]

    expect(bubble_sort(input)).to eq([10])
  end
end
