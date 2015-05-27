class Document < ActiveRecord::Base
  mount_uploader :attachment, DocumentUploader
  validates :name, presence: true,
            length: { in: 3..30 }
  validates :short_description, presence: true,
            length: { in: 3..150 }
end
