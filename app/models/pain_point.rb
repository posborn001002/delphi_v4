class PainPoint < ApplicationRecord
  belongs_to :workshop
  has_and belongs_to_many :toe_tags
end
