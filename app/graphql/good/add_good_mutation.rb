AddGoodMutation = GraphQL::Relay::Mutation.define do
  name 'AddGood'
  description 'it needs authenticate user'
  input_field :title, !types.String, 'Title for this good'
  input_field :description, types.String, 'Description for this good'
  input_field :image, types.String, 'The url of image for this good'

  return_field :good, GoodType
  resolve Auth.mutation_authenticate_user! do |inputs, ctx|
    user = ctx[:current_user]
    good = user.goods.build(title: inputs[:title], description: inputs[:description], image: inputs[:image])
    good.save!

    { good: good }
  end
end
