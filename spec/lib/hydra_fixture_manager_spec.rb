require File.join(File.dirname(__FILE__), "/../spec_helper")
require File.join(File.dirname(__FILE__), "/../../lib/hydra_fixture_manager")
require File.join(File.dirname(__FILE__), "/../../lib/hydra_fixture_utils")
require 'active-fedora'

module Hydra
  describe FixtureManager do
    context "basic behavior" do
      it "instantiates as a Hydra::FixtureManager object" do
        foo = Hydra::FixtureManager.new
        foo.class.should eql(Hydra::FixtureManager)
      end
      
      it "knows where the default fixtures are stored" do
        foo = Hydra::FixtureManager.new
        foo.fixture_directory.should eql(File.join(File.dirname(__FILE__), "/../../lib/hydra-fixtures/fixtures"))
      end
      
      it "can set the fixture directory to point elsewhere" do
        foo = Hydra::FixtureManager.new(:fixture_directory => "/tmp")
        foo.fixture_directory.should eql("/tmp")
      end
      
      it "raises an exception if asked to use a non-existent fixtures directory" do
        lambda{Hydra::FixtureManager.new(:fixture_directory => "/foo/bar")}.should raise_exception
      end
      
      it "can provide a list of all the fixture files" do
        foo = Hydra::FixtureManager.new
        fl = foo.file_list
        fl.should be_kind_of(Array)
        fl.length.should eql(17)
      end
      
      it "can provide a list of all the PIDs" do
        foo = Hydra::FixtureManager.new
        pid_list = foo.pid_list
        pid_list.should be_kind_of(Array)
        pid_list.length.should eql(17)
        pid_list.include?("libra-oa:8").should eql(true)
      end
      
    end
    
    context "connecting to fedora" do
      before(:all) do
        @fm = Hydra::FixtureManager.new
      end
      
      it "knows which fedora repository it's using" do
        @fm.fedora_url.should eql("http://fedoraAdmin:fedoraAdmin@127.0.0.1:8983/fedora")
      end
      
      it "knows whether it has a valid connection to fedora" do
        @fm.connection?.should eql(true)
      end
      
    end
  
  end
end