MutationType = GraphQL::ObjectType.define do
  name 'MutationRoot'
  description 'Its mutation root of schema'

  field :addGood, field: AddGoodMutation.field
  field :updateGood, field: UpdateGoodMutation.field
  field :deleteGood, field: DeleteGoodMutation.field
end
