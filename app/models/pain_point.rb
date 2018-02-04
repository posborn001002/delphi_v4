class PainPoint < ApplicationRecord
  belongs_to :Workshop
  has_and belongs_to_many :ToeTags
end
