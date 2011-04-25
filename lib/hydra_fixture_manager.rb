
module Hydra
  class FixtureManager
    
    attr_accessor :fixture_directory    # Where are the foxml fixtures stored?
                                        # Default location is lib/hydra-fixtures/fixtures
    
    # WHAT_DOES_THIS_METHOD_DO?
    # @param
    # @return
    # @example
    def initialize(opts = {})
      if(opts[:fixture_directory])
        raise "#{opts[:fixture_directory]} isn't a directory!" unless File.directory? opts[:fixture_directory]
        @fixture_directory = opts[:fixture_directory]
      else
        @fixture_directory = File.join(File.dirname(__FILE__), "/hydra-fixtures/fixtures")
      end
    end

    # Return an array containing the PIDs of all the fixture objects in scope
    # @return [Array<String>] an array of Strings, each of which is the PID of a fixture object
    def getFixtureList
      
    end

  end
end