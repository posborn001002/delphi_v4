class Organization < ApplicationRecord
  has_many :People
  has_many :CustomerJobs
  accepts_nested_attributes_for :people

  has_many :customers, through Organization
  has_many :suppliers, through Organization

  validates :name, presence: true
end
