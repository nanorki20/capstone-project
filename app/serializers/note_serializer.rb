class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
  belongs_to :bucket_list
end
