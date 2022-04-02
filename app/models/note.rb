class Note < ApplicationRecord
  validates :text, presence: true

  after_create_commit { broadcast_prepend_later_to 'notes', partial: 'notes/note', locals: { note: self }, target: 'notes' }
  after_update_commit { broadcast_replace_later_to 'notes' }
  after_destroy_commit { broadcast_remove_to 'notes' }
end
