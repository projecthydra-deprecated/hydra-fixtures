require 'active-fedora'

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
      ActiveFedora.init unless Thread.current[:repo]
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
    
    # return the url of the fedora repo currently being used
    # @return [String] the fedora url
    def fedora_url
      ActiveFedora.fedora.fedora_url.to_s
    end
    
    # Do we have a valid connection to fedora?
    # @return [Boolean] true if we have a connection, otherwise false
    def connection?
      begin
        obj = ActiveFedora::Base.load_instance("fedora-system:FedoraObject-3.0")
        if(obj.pid == "fedora-system:FedoraObject-3.0")
          return true
        else
          logger.debug("Tried to load fedora-system:FedoraObject-3.0 from #{self.fedora_url} but I couldn't.")
          return false
        end
      rescue Errno::ECONNREFUSED
        logger.error("Can't connect to fedora! Attempting to connect to #{self.fedora_url}")
        return false
      end
    end
    
    # Load all the fixtures
    # @param
    # @return
    # @example
    def load_all_fixtures
      
    end
    
    # WHAT_DOES_THIS_METHOD_DO?
    # @param [String] pid the PID of the fixture to delete from Fedora
    # @return [Boolean] true if the fixture was deleted, false if it wasn't found
    # @example
    def delete_fixture(pid)
      
    end


  end
end