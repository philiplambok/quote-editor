class Note < ApplicationRecord
  validates :text, presence: true

  broadcasts_to ->(_note) { 'notes' }, inserts_by: :prepend
end
