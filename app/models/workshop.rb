class Workshop < ApplicationRecord
  belongs_to :date_lookup
  belongs_to :organization
  accepts_nested_attributes_for :organization


  has_and_belongs_to_many :people, inverse_of: :workshops
  has_many :toe_tags, inverse_of: :workshops
  has_many :pain_points, inverse_of: :workshops
  has_many :action_results, inverse_of: :workshops




end
