require 'bundler'
Bundler.setup

require 'rake'
require 'rspec'
require 'rspec/core/rake_task'

$:.unshift File.expand_path('../lib', __FILE__)
require 'branch/version'

task :build do
  # system 'gem build branch.gemspec'
end

task :install => :build do
  # system "sudo gem install branch-#{Branch::VERSION}.gem"
end

task :release => :build do
  puts "Tagging #{Branch::VERSION}... (not yet)"
  # system "git tag -a #{Branch::VERSION} -m 'Tagging #{Branch::VERSION}'"
  puts 'Pushing to Github (not yet)'
  # system 'git push --tags'
  puts 'Pushing to rubygems.org... (not yet)'
  # system 'gem push branch-#{Branch::VERSION}'
end

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

task :default => :spec
task :test => :spec