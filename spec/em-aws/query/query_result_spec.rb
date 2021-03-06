require_relative '../../spec_helper'

describe EventMachine::AWS::Query::QueryResult do
  before(:each) do
    @response = DummyHttpResponse.new
  end
  
  subject {EventMachine::AWS::Query::QueryResult.new @response}
  
  it_behaves_like "an AWS Response"
  
  it "tracks its inner attributes" do
    subject[:dummy_value].should == 'Garbonzo!'
  end
  
  it "gets attributes indifferently" do
    subject['DummyValue'].should == 'Garbonzo!'
  end
  
  it "can make dynamic method calls" do
    subject.dummy_value.should == 'Garbonzo!'
  end
  
  it "handles arrays of members" do
    subject[:topics].should have(2).topics
    subject.topics.first.should == {topic_arn: 'arn:aws:sns:us-east-1:429167422711:EM-AWS-Test-Topic'}
  end
  
  it "treats multiple elements with the same name as an array" do
    subject.plural_thing.should == [17, 'hello', 9.2]
  end
  
  it "handles key/value entry pairs" do
    subject[:attributes].should have(3).keys
    subject.attributes[:foo].should == 'Bar'
  end
  
  it "knows its action" do
    subject.action.should == 'DummyAction'
  end
  
  it "knows its request ID" do
    subject.request_id.should == 'd6252bf1-5210-11e1-892f-6dd5825e297d'
  end
  
  it "converts to integers appropriately" do
    subject.attributes[:some_timestamp].should == 1328734660
  end
  
  it "converts to floats appropriately" do
    subject.attributes[:some_num].should == 22.500
  end
  
  it "returns an empty value on dynamic method calls instead of failing" do
    subject.empty_value.should == nil
  end
  
  
end