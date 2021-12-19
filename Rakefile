# frozen_string_literal: true

require "bundler/gem_tasks"
require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: :rubocop

task :run do
  ruby 'lib/monty_hall.rb'
end

task :test do
  ruby 'test/monty_hall_test.rb'
end
