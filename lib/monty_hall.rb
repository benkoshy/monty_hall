# frozen_string_literal: true

require_relative "monty_hall/version"

module MontyHall
  class Error < StandardError; end

  class Game
    # doors numbered from 1 to x
    # we can pick any number from 1 to x, provided it is not open
    attr_reader :doors, :number_of_doors_to_open, :always_switch, :winning_door

    def initialize(doors: 3, number_of_doors_to_open: 1, always_switch: true)
      @doors = doors
      @winning_door = pick_a_door
      @initial_choice = pick_a_door
      @always_switch = always_switch
    end

    def won?
      if @always_switch
        return @winning_door == door_chosen_after_switching
      else
        return @winning_door == @initial_choice
      end
    end

    def door_chosen_after_switching
      # (1) we've already chosen a door
      # (2) the host opens another door:
      opened_doors = open_doors(number_to_open: 1)

      # (3) the host asks us: do you want to pick another door?
      # (4) Let's pick another door - one that is not open,
      #     and not our initial choice

      excluded_doors = opened_doors.insert(@initial_choice)

      return pick_a_door(but_exclude_doors_we_cannot_open: excluded_doors)
    end

    def open_doors(number_to_open: 1)
      doors_we_cannot_open = [@initial_choice, @winning_door]
      doors_we_can_open = ( all_doors - doors_we_cannot_open)

      # let's pick from among the open doors
      doors_we_can_open.sample(number_to_open)
    end

    def all_doors
      all_doors = (1..@doors).to_a
    end

    def pick_a_door(but_exclude_doors_we_cannot_open: [])
      ( all_doors - but_exclude_doors_we_cannot_open).sample
    end
  end
end
