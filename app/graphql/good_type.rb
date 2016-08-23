GoodType = GraphQL::ObjectType.define do
  name 'Good'
  interfaces [NodeIdentification.interface]
  description 'Information about good for bidding'
  global_id_field :id
  field :title, types.String, 'Title for this good'
  field :description, types.String, 'Description for this good'
  camelized_field :bidding_time, types.String, 'The the bidding finish time'
  field :image, types.String, 'The url of image for this good'
  camelized_field :created_at, !types.String, 'The date of good creation time'
  camelized_field :updated_at, !types.String, 'The date of good info be updated'
end
