class InviteSerializer < ActiveModel::Serializer
  attributes :id, :team, :sender, :receiver

end
