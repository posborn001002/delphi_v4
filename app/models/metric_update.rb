class MetricUpdate < StatusUpdate

  belongs_to :metric, inverse_of: :metric_updates
  delegate :name, to: :metric, prefix: false

end