
module Hydra
  class FixtureManager
    
    attr_accessor :fixture_directory    # Where are the foxml fixtures stored?
                                        # Default location is lib/hydra-fixtures/fixtures
    attr_accessor :file_list            # The list of all the fixture files we're working with
    attr_accessor :pid_list             # The list of all the PIDs we're working with
    
    # Initialize the FixtureManager
    # @param [Hash] opts an optional Hash of parameters
    # @param [Symbol] fixture_directory Where are the fixture files stored? 
    # @example
    #   foo = Hydra::FixtureManager.new(:fixture_directory => "/tmp")
    def initialize(opts = {})
      if(opts[:fixture_directory])
        raise "#{opts[:fixture_directory]} isn't a directory!" unless File.directory? opts[:fixture_directory]
        @fixture_directory = opts[:fixture_directory]
      else
        @fixture_directory = File.join(File.dirname(__FILE__), "/hydra-fixtures/fixtures")
      end
      @pid_list = []
      read_fixtures
    end
    
    # Read in the fixtures and cache a list of their PIDs
    # @return [Array<String>] An array of Strings, one for each PID
    def read_fixtures
      # Read in all the files
      @file_list = Dir["#{@fixture_directory}/*.foxml.xml"]
      
      # Get the PID for each one
      @file_list.each do |file|
        @pid_list << Hydra::FixtureUtils.extract_pid(file)
      end
    end


  end
end