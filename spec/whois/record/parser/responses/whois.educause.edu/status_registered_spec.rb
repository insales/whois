# encoding: utf-8

# This file is autogenerated. Do not edit it manually.
# If you want change the content of this file, edit
#
#   /spec/fixtures/responses/whois.educause.edu/status_registered.expected
#
# and regenerate the tests with the following rake task
#
#   $ rake genspec:parsers
#

require 'spec_helper'
require 'whois/record/parser/whois.educause.edu.rb'

describe Whois::Record::Parser::WhoisEducauseEdu, "status_registered.expected" do

  before(:each) do
    file = fixture("responses", "whois.educause.edu/status_registered.txt")
    part = Whois::Record::Part.new(:body => File.read(file))
    @parser = klass.new(part)
  end

  describe "#status" do
    it do
      @parser.status.should == :registered
    end
  end
  describe "#available?" do
    it do
      @parser.available?.should == false
    end
  end
  describe "#registered?" do
    it do
      @parser.registered?.should == true
    end
  end
  describe "#created_on" do
    it do
      @parser.created_on.should be_a(Time)
      @parser.created_on.should == Time.parse("1998-03-11")
    end
  end
  describe "#updated_on" do
    it do
      @parser.updated_on.should be_a(Time)
      @parser.updated_on.should == Time.parse("2009-10-02")
    end
  end
  describe "#expires_on" do
    it do
      @parser.expires_on.should be_a(Time)
      @parser.expires_on.should == Time.parse("2010-07-31")
    end
  end
  describe "#nameservers" do
    it do
      @parser.nameservers.should be_a(Array)
      @parser.nameservers.should have(3).items
      @parser.nameservers[0].should be_a(_nameserver)
      @parser.nameservers[0].should == _nameserver.new(:name => "ns3.educause.edu", :ipv4 => "198.59.61.50")
      @parser.nameservers[1].should be_a(_nameserver)
      @parser.nameservers[1].should == _nameserver.new(:name => "ns4.educause.edu", :ipv4 => "192.52.179.69")
      @parser.nameservers[2].should be_a(_nameserver)
      @parser.nameservers[2].should == _nameserver.new(:name => "ns5.educause.edu", :ipv4 => "198.59.61.50")
    end
  end
end