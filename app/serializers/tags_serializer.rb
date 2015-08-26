class TagsSerializer < ActiveModel::Serializer
  atrribute :name

  url [:notes, :tags]

end
