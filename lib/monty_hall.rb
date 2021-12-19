# frozen_string_literal: true

require_relative "monty_hall/version"

module MontyHall
  class Error < StandardError; end

  class Game

    # doors numbered from 1 to x
    attr_reader :doors

    def initialize(doors: 3)
      @doors = doors

      @winning_door = pick_doors
      @my_choice = pick_doors
    end

    def always_switch
      if lost?
        # open_doors
        # choose from doors that are: (i) not the winning door, nor the door that was initially chosen

        # pick again
        # set result
      else

      end
    end

    def open_doors
      1..@doors - [@my_choice, @winning_door]
    end

    def lost?
      @winning_door != @my_choice
    end

    def pick_doors()
      rand(1..@doors)
    end
  end
end
