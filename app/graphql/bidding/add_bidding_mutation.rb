AddBiddingMutation = GraphQL::Relay::Mutation.define do
  name 'AddBidding'
  description 'it needs authenticate user'
  input_field :id, !types.ID, 'ID of good'
  input_field :amount, !types.Int, 'Amount for getting this good'
  input_field :trashWord, types.String, 'Talk trash for this bidding'

  return_field :bidding, BiddingType
  resolve Auth.authenticate_user! -> (inputs, ctx) do
    user = ctx[:current_user]
    good = Good.find(inputs[:id])
    bidding = good.biddings.build(amount: inputs[:amount], trash_word: inputs[:trashWord])
    bidding.user = user
    bidding.save!

    { bidding: bidding }
  end
end
