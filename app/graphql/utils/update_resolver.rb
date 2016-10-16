class UpdateResolver
  def initialize(return_field)
    @filed_key = return_field
  end

  def call(inputs, ctx)
    obj = NodeIdentification.object_from_id(inputs[:id], ctx)
    new_data = inputs.to_h
    new_data.delete('clientMutationId')
    new_data.delete('id')
    obj.update!(new_data)

    { @filed_key => obj }
  end
end
