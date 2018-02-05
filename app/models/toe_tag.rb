class ToeTag < ApplicationRecord
  has_and_belongs_to_many :people, :join_table => 'teams'
  has_and_belongs_to_many :pain_points
end
