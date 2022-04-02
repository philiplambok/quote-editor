class Note < ApplicationRecord
  belongs_to :user

  validates :text, presence: true

  broadcasts_to ->(note) { [note.user, 'notes'] }, inserts_by: :prepend
end
