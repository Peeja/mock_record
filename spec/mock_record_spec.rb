$: << File.join(File.dirname(__FILE__), '..', 'lib')
require 'mock_record'

describe MockRecord do
  it "lets any attribute be set" do
    lambda {
      MockRecord.new.any_attribute_at_all = :a_value
    }.should_not raise_error(NoMethodError)
  end
  
  it "recalls any set attribute" do
    mr = MockRecord.new
    mr.any_attribute_at_all = :a_value
    mr.any_attribute_at_all.should == :a_value
  end
  
  it "begins as a new record" do
    MockRecord.new.should be_a_new_record
  end
  
  it "is no longer a new record once saved" do
    mr = MockRecord.new
    mr.save!
    mr.should_not be_a_new_record
  end
  
  it "begins not dirty" do
    MockRecord.new.should_not be_dirty
  end
  
  it "is dirty after a value is set" do
    mr = MockRecord.new
    mr.any_attribute_at_all = :a_value
    mr.should be_dirty
  end
  
  it "is no longer dirty once saved" do
    mr = MockRecord.new
    mr.any_attribute_at_all = :a_value
    mr.save!
    mr.should_not be_dirty
  end
end
