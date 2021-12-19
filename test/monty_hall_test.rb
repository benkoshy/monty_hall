# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/cool_program'

# Test program coolness
class MontyHallTest < Minitest::Test
  def test_monty_hall
    # skip
    assert_equal CoolProgram.new.coolness, 11
  end
end
