class Metric < ApplicationRecord
  belongs_to :action_result
  belongs_to :toe_tag
  has_many :metrics
end
