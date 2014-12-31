require 'rspec'
require_relative 'page_number_generator'

RSpec.describe 'Page Number Generator' do

  it 'calculates the page number layout of a book using a positive even number' do
    input = 10

    expect(generate_pages(input)).to eq [[1, 10], [2, 9], [3, 8], [4, 7], [5, 6]]
  end

  it 'raises ArgumentError if an odd number is passed' do
    input = 11

    expect{ generate_pages(input) }.to raise_error(ArgumentError)
  end

  it 'raises ArgumentError if an even negative number is passed' do
    input = -2

    expect{ generate_pages(input) }.to raise_error(ArgumentError)
  end

  it 'raises ArgumentError if a string is passed' do
    input = 'Apple'

    expect{ generate_pages(input) }.to raise_error(ArgumentError)
  end

  it 'raises ArgumentError if zero is passed' do
    input = 0

    expect{ generate_pages(input) }.to raise_error(ArgumentError)
  end
end

