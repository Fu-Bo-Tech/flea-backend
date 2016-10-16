GoodType = GraphQL::ObjectType.define do
  name 'Good'
  interfaces [NodeIdentification.interface]
  description 'Information about good for bidding'
  global_id_field :id
  field :title, !types.String, 'Title for this good'
  field :description, types.String, 'Description for this good'
  camelized_field :bidding_time, types.String, 'The the bidding finish time'
  field :image, types.String, 'The url of image for this good'
  camelized_field :highest_bidding, BiddingType, 'The highest bidding'
  camelized_field :extended_count, types.Int, 'number of bidding time extended'
  camelized_field :created_at, !types.String, 'The date of good creation time'
  camelized_field :updated_at, !types.String, 'The date of good info be updated'
  connection :allBiddings, field: GoodBiddingsQuery, max_page_size: 50
  field :owner, !UserType, 'The owner of good'
end
