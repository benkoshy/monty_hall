# frozen_string_literal: true

require_relative "monty_hall/version"

module MontyHall
  class Error < StandardError; end

  class Game
    # doors numbered from 1 to x
    attr_reader :doors, :number_of_doors_to_open, :always_switch, :winning_door

    def initialize(doors: 3, number_of_doors_to_open: 1, always_switch: true)
      @doors = doors
      @winning_door = pick_door
      @initial_choice = pick_door
      @always_switch = always_switch
    end

    def won?
      if @always_switch
        return correct_door?(door_chosen_when_switching)
      else
        return correct_door?(door_chosen_when_staying_put)
      end
    end

    def correct_door?(chosen_door)
      @winning_door == chosen_door
    end

    def door_chosen_when_staying_put
      return @initial_choice
    end

    def door_chosen_when_switching
      opened_doors = open_doors(number_to_open: 1)
      return pick_door(excluding_opened_doors: opened_doors << @initial_choice)
    end

    def open_doors(number_to_open: 1)
      ((1..@doors).to_a - [@initial_choice, @winning_door]).sample(number_to_open)
    end


    def pick_door(excluding_opened_doors: [])
      ( (1..@doors).to_a - excluding_opened_doors).sample
    end
  end
end
