UserType = GraphQL::ObjectType.define do
  name 'User'
  interfaces [NodeIdentification.interface]
  description 'Information about User'
  global_id_field :id
  field :name, !types.String, 'Name of user'
  field :email, types.String, 'The the bidding finish time'
  field :goods, -> { types[GoodType] }, 'All goods of user'
end
