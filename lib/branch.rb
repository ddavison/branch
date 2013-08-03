# encoding: utf-8
module Branch
  class Runner
    attr_reader :file

    # set the file
    #
    # @param [String] file the file to copy
    def self.file=(file)
      @file = file
    end

    # get the file
    #
    # @return [String] the file
    def self.file
      @file
    end


    def initialize(args=[])
      @file = File.expand_path(args.first)
    end
  end
end