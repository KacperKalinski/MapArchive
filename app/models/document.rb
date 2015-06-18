class Document < ActiveRecord::Base
  mount_uploader :attachment, DocumentUploader
  validates :attachment, presence: true
  validates :name, length: {in: 3..30}
  validates :short_description,
            length: {in: 3..150}
end
