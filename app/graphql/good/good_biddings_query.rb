GoodBiddingsQuery = GraphQL::Field.define do
  type BiddingsConnectionType
  description 'Good\'s biddings'
  argument :after, types.String
  argument :before, types.String
  argument :first, types.Int
  argument :last, types.Int
  resolve -> (obj, _, _) do
    obj.biddings
  end
end
