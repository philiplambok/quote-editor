class Note < ApplicationRecord
  belongs_to :user
  has_many :date_notes

  validates :text, presence: true

  broadcasts_to ->(note) { [note.user, 'notes'] }, inserts_by: :prepend
end
