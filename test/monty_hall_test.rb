# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/monty_hall'

# Test program coolness
class MontyHallTest < Minitest::Test
  def test_initialize_doors
    assert_equal MontyHall::Game.new().doors, 3
    assert_equal MontyHall::Game.new(doors: 5).doors, 5
  end

  def test_open_doors_should_not_include_the_winning_door
    game = MontyTestClass.new(doors: 3, number_of_doors_to_open: 1, always_switch: true)
    winning_door = 0
    1.upto(100) do |i|
      game.set_winning_door(rand(1..3))
      refute game.open_doors(number_to_open: 1).include?(winning_door)
    end
  end

  def test_open_doors_should_not_include_the_chosen_door
    game = MontyTestClass.new(doors: 3, number_of_doors_to_open: 1, always_switch: true)

    1.upto(100) do |i|
      chosen_door = i / 3
      game.set_chosen_door(chosen_door)
      refute game.open_doors(number_to_open: 1).include?(chosen_door)
    end
  end


end



class MontyTestClass < MontyHall::Game
  def initialize(params)
    super(**params)
  end

  def set_winning_door(winning_door)
    @winning_door = winning_door
  end

  def set_chosen_door(initial_choice)
    @initial_choice = initial_choice
  end
end
