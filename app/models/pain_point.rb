class PainPoint < ApplicationRecord

  belongs_to :toe_tag, inverse_of: :pain_points

  belongs_to :process_owner, inverse_of: :pain_points

  belongs_to :action_result, inverse_of: :pain_points

  has_many :pain_point_updates, inverse_of: :pain_point

  has_one :workshop, through: :toe_tag

end
