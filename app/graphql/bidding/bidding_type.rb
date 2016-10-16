BiddingType = GraphQL::ObjectType.define do
  name 'Bidding'
  interfaces [NodeIdentification.interface]
  description 'Information about bidding of good'
  global_id_field :id
  field :amount, !types.Int, 'Amount of this bidding'
  camelized_field :trash_word, types.String, 'Talk trash for this bidding'
  camelized_field :created_at, !types.String, 'The date of bidding creation time'
  field :user, !UserType, 'The owner of bidding'
  field :good, !GoodType, 'The good of bidding'
end
