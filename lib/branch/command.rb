# encoding: utf-8
require 'optparse'

options = {}

OptionParser.new do |opts|
  opts.banner = 'Usage: branch [options] file path...'

  opts.on('-v', '--version', 'Show the version') do
    require 'branch/version'
    puts Branch::VERSION
    exit
  end

  opts.on_tail('-h', '--help', 'Show the usage') do
    puts opts
    exit
  end


  if ARGV.size <= 0
    puts opts
    exit 1
  end

  opts.parse!
end

if ARGV.size > 0 && !File.exists?(ARGV.first)
  puts "#{ARGV.first} doesn't exist"
  exit 1
end

if options.empty?
  Branch::Runner.new(ARGV)
else
  Branch::Runner.new(ARGV, options)
end
