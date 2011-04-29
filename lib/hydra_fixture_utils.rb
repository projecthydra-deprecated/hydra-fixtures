require 'nokogiri'

module Hydra
  class FixtureUtils
    
    # Given a foxml fixture object, extract its pid
    # @param [String] file the fully qualified path to the fixture file
    # @return [String] the PID of the object in question
    # @example
    #   Hydra::FixtureUtils.extract_pid("/path/to/libra-oa_8.foxml.xml")
    #   => libra-oa:8
    def self.extract_pid(file)
      raise "Can't find file #{file}" unless File.file? file
      reader = Nokogiri::XML::Reader(IO.read(file))
      reader.each do |node|
        if(node.name=='foxml:digitalObject' and node.node_type==1)
          return node.attribute('PID')
        end
      end
    end
    
  end #class
end # module