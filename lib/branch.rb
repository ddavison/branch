# encoding: utf-8
require 'fileutils'

module Branch
  class Runner
    attr_reader :file, :dirs

    # set the file
    #
    # @param [String] file the file to copy
    def self.file=(file)
      @file = file
    end

    # get the file
    #
    # @return [String] the file that is being copied
    def self.file
      @file
    end

    # set the directories
    #
    # @param [Array] dirs the directories to copy the file to
    def self.dirs=(dirs=[])
      @dirs = dirs
    end

    # get the directories
    #
    # @return [Array] the directories to copy to
    def self.dirs
      @dirs
    end

    def initialize(args=[])
      @file = File.expand_path(args.first)
      @dirs = args
      @dirs.shift
    end

    # branch the file
    def branch
      @dirs.each do |directory|
        # cp the file to the directory.
        begin
          FileUtils.cp(@file, File.expand_path(directory))
        rescue
          puts "couldn't copy #{@file} to #{directory}. this could be a permission issue. aborting."
        end
      end
    end
  end
end