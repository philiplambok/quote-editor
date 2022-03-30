class Note < ApplicationRecord
  validates :text, presence: true

  after_create_commit { broadcast_prepend_to 'notes', partial: 'notes/note', locals: { note: self }, target: 'notes' }
end
