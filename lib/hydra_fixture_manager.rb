
module Hydra
  class FixtureManager
    
    attr_accessor :fixture_directory    # Where are the foxml fixtures stored?
                                        # Default location is lib/hydra-fixtures/fixtures
    attr_accessor :fixture_list         # The list of all the fixtures we're working with
    
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
      
      # Read in all the files
      @fixture_list = Dir["#{@fixture_directory}/*"]
    end


  end
end