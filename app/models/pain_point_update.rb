class PainPointUpdate < ApplicationRecord
  belongs_to :PainPoint
  belongs_to :progress_id, polymorphic: true

end
