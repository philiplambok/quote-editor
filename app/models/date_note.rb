class DateNote < ApplicationRecord
  belongs_to :note

  validates :date, presence: true
end
