class Metric < ApplicationRecord

  belongs_to :action_result, inverse_of: :metric

  belongs_to :toe_tag, inverse_of: :metric

  has_many :measurements, inverse_of: :metric

  has_many :metric_updates, inverse_of: :metric

end
