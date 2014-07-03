require 'bundler/setup'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'
desc 'Run Ruby style checks'
Rubocop::RakeTask.new(:style)

# We cannot run Test Kitchen on Travis CI yet...
desc 'Run tests on Travis'
task ci: [:style, :spec]
