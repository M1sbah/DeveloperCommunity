class Activity < ApplicationRecord
  belongs_to :management
  has_many :tasks
end
