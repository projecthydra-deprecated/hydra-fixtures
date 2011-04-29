require File.join(File.dirname(__FILE__), "/../spec_helper")
require File.join(File.dirname(__FILE__), "/../../lib/hydra_fixture_manager")
require File.join(File.dirname(__FILE__), "/../../lib/hydra_fixture_utils")

module Hydra
  describe FixtureUtils do
    
    context "extracting PIDs from fixture files" do
      it "checks that a fixture file exists before attempting to extract a PID" do
        lambda{Hydra::FixtureUtils.extract_pid("/foo/bar")}.should raise_exception(/Can't find file/)
      end
  
      it "extracts a PID from a FOXML file" do
        fixture_dir = Hydra::FixtureManager.new.fixture_directory
        pid = Hydra::FixtureUtils.extract_pid("#{fixture_dir}/libra-oa_8.foxml.xml")
        pid.should eql("libra-oa:8")
      end
    end
    
  end
end