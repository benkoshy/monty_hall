# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/monty_hall'

# Test program coolness
class MontyHallTest < Minitest::Test
  def test_initialize_doors
    assert_equal MontyHall::Game.new().doors, 3
    assert_equal MontyHall::Game.new(doors: 5).doors, 5
  end

  def test_door_chosen_when_switching
    game = MontyHall::Game.new(doors: 3, number_of_doors_to_open: 1, always_switch: true)
  end
end
