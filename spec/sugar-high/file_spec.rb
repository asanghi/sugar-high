require 'spec_helper'
require 'sugar-high/file'

describe "SugarHigh" do
  describe "File" do
    let(:empty_file) { fixture_file 'empty.txt' }
    let(:file)       { fixture_file 'non-empty.txt'}

    describe '#self.blank' do
      it "should return true for an empty file" do
        File.blank?(empty_file).should be_true 
      end

      it "should return false for a NON-empty file" do
        File.blank?(file).should_not be_true
      end
    end

    describe '#blank' do    
      it "should return true for an empty file" do
        File.new(empty_file).blank?.should be_true
      end

      it "should return false for a NON-empty file" do
        File.new(file).blank?.should_not be_true
      end
    end
  end
  
  describe 'String path ext' do    
    describe '#path' do    
      it "should return a String extended with PathString" do
        path_str = "a/b/c".path
        path_str.kind_of?(PathString).should be_true
        path_str.respond_to?(:up).should be_true
        path_str.respond_to?(:down).should be_true
      end
    end 
  end

  describe 'PathString' do    
    describe '#up' do    
      it "should go up two folder levels" do
        up_path = "a/b/c".path.up(2)        
        up_path.should == "../../a/b/c"
      end
    end

    describe '#down' do    
      it "should go down two folder levels" do
        dwn_path = "../../a/b/c".path.down(2)        
        dwn_path.should == "a/b/c"
      end
    end
  end
end
    
