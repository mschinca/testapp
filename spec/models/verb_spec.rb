require 'spec_helper'

describe Verb do
  let(:verb) { FactoryGirl.create(:verb) }

  it "should be valid with valid fields" do
    verb.should be_valid
  end

  %w(infinite present past_simple present_perfect).each do |attribute|
    it "requires #{attribute}" do
      verb.send("#{attribute}=".to_sym, nil)
      verb.should_not be_valid
      verb.errors[attribute.to_sym].should_not be_nil
    end
  end
end
