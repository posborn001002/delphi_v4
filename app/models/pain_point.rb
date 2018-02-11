class PainPoint < ApplicationRecord
  belongs_to :workshop
  belongs_to :toe_tag
  belongs_to :organization
  belongs_to :action_result
end
