class NotesSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  has_many :tags, serializer: TagsSerializer

end
