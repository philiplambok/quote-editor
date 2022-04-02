class Note < ApplicationRecord
  validates :text, presence: true

  after_create_commit { broadcast_prepend_to 'notes', partial: 'notes/note', locals: { note: self }, target: 'notes' }
  after_update_commit { broadcast_replace_to 'notes' }
  after_destroy_commit { broadcast_remove_to 'notes' }
end
