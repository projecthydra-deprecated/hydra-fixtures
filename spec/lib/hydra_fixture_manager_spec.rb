require File.join(File.dirname(__FILE__), "/../spec_helper")
require File.join(File.dirname(__FILE__), "/../../lib/hydra_fixture_manager")

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
      
      it "can provide a list of all the fixtures" do
        foo = Hydra::FixtureManager.new
        fl = foo.fixture_list
        fl.should be_kind_of(Array)
        fl.length.should eql(17)
      end
      
    end
  end
end