# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/monty_hall'

# Test program coolness
class MontyHallTest < Minitest::Test
  def test_initialize_doors
    assert_equal MontyHall::Game.new().doors, 3
    assert_equal MontyHall::Game.new(doors: 5).doors, 5
  end

  def test_initialize_strategy
    assert_equal MontyHall::Game.new().selected_strategy, :always_switch
    refute_equal MontyHall::Game.new(selected_strategy: :stay_put).selected_strategy, :always_switch
    assert_equal MontyHall::Game.new(selected_strategy: :stay_put).selected_strategy, :stay_put
    assert_equal MontyHall::Game.new(selected_strategy: MontyHall::Game::STRATEGY[1]).selected_strategy, :stay_put
  end
end
