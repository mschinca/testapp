# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :verb do
    infinite "to go"
    present "go"
    past_simple "went"
    present_perfect "gone"
  end
end
