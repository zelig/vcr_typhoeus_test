require 'spec_helper'

describe "Typhoeus" do

  it "should have version 0.6.6" do
    Typhoeus::VERSION.should == "0.6.6"
  end

  it "VCR" do
    VCR.version.should == "2.8.0"
  end

  it "encoded_body should be defined on Request" do
    ::Typhoeus::Request.method_defined?(:encoded_body).should be_true
  end

  it "should allow hash as body and correctly return encoded_body" do
    req = Typhoeus::Request.new("http://blah.com", :body => { :text => 'text' } )
    req.encoded_body.should == "text=text"
  end

  it "(vcr hook) should allow hash as body" do
    VCR.use_cassette("vcr_test") do
      Typhoeus::Request.post("http://blah.com", :body => { :text => 'text' } )
    end
  end
end
