class Search < ActiveRecord::Base
  belongs_to :user
  validates_length_of :phrase, :within => 1..100
end
