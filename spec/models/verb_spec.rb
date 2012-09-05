require 'spec_helper'

describe Verb do
  let(:verb) { FactoryGirl.create(:verb) }

  it "should be valid with valid fields" do
    verb.should be_valid
  end
end
