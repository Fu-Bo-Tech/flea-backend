GoodQuery = GraphQL::Field.define do
  type GoodType
  description 'Query good by its id'
  argument :id, !types.ID, 'Id of good'
  resolve -> (_, args, ctx) do
    NodeIdentification.object_from_id(args[:id], ctx)
  end
end
