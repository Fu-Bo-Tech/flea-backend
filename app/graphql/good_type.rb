GoodType = GraphQL::ObjectType.define do
  name 'Good'
  description 'Information about good for bidding'
  field :id, !types.ID, 'Unique id for this good'
  field :title, types.String, 'Title for this good'
  field :description, types.String, 'Description for this good'
  camelized_field :bidding_time, types.String, 'The the bidding finish time'
  field :image, types.String, 'The url of image for this good'
  camelized_field :created_at, !types.String, 'The date of good creation time'
  camelized_field :updated_at, !types.String, 'The date of good info be updated'
end
