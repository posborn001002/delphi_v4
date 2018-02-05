class PainPointUpdate < ApplicationRecord
  belongs_to :pain_point
  belongs_to :progress_id, polymorphic: true

end
