#!/usr/bin/env rake

require "rake/testtask"
require "rubocop/rake_task"

# run tests
desc "default checks"
task default: [:lint]

# Rubocop
desc "Run Rubocop lint checks"
task :rubocop do
  RuboCop::RakeTask.new
end

# lint the project
desc "Run robocop linter"
task lint: [:rubocop]

# Automatically generate a changelog for this project. Only loaded if
# the necessary gem is installed.
# use `rake changelog to=1.2.0`
begin
  v = ENV["to"]
  require "github_changelog_generator/task"
  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
    config.future_release = v
  end
rescue LoadError
  puts ">>>>> GitHub Changelog Generator not loaded, omitting tasks"
end
