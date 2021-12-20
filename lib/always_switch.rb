# frozen_string_literal: true

require_relative "monty_hall"


won = 0
lost = 0

1.upto(500) do
  game = MontyHall::Game.new(doors: 3, number_of_doors_to_open: 1, always_switch: true)

  if game.won?
    won += 1
  else
    lost += 1
  end
end

puts "Monty Hall - always switch: won: #{won}, lost: #{lost}, winning percentage: #{ (won.to_f / (won + lost))}"
