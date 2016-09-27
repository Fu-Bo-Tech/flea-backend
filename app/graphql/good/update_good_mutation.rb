UpdateGoodMutation = GraphQL::Relay::Mutation.define do
  name 'UpdateGood'
  input_field :id, !types.ID
  input_field :title, types.String, 'Title for this good'
  input_field :description, types.String, 'Description for this good'
  input_field :image, types.String, 'The url of image for this good'

  return_field :good, GoodType
  resolve(UpdateResolver.new(:good))
end
