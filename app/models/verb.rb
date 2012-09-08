class Verb < ActiveRecord::Base
  attr_accessible :infinite, :past_simple, :present, :present_perfect
  validates_presence_of :infinite, :past_simple, :present, :present_perfect

end
