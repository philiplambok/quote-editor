class Note < ApplicationRecord
  belongs_to :user

  validates :text, presence: true

  broadcasts_to ->(_note) { 'notes' }, inserts_by: :prepend
end
