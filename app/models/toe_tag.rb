class ToeTag < ApplicationRecord
  has_many :People, through :Teams
  has_and_belongs_to_many :PainPoints
end
