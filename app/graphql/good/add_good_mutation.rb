AddGoodMutation = GraphQL::Relay::Mutation.define do
  name 'AddGood'

  input_field :title, !types.String, 'Title for this good'
  input_field :description, types.String, 'Description for this good'
  input_field :image, types.String, 'The url of image for this good'

  return_field :good, GoodType
  resolve -> (inputs, _) {
    good = Good.new(title: inputs[:title], description: inputs[:description], image: inputs[:image])
    good.save!

    { good: good }
  }
end
