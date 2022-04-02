class Note < ApplicationRecord
  belongs_to :user

  validates :text, presence: true

  broadcasts_to ->(_note) { [User.current_user, 'notes'] }, inserts_by: :prepend
end
