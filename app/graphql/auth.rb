module Auth
  class Unauthenticated < StandardError; end

  def self.query_authenticate_user!(&block)
    -> (obj, args, ctx) do
      raise Unauthenticated unless ctx[:current_user]
      block.call(obj, args, ctx)
    end
  end

  def self.mutation_authenticate_user!(&block)
    -> (inputs, ctx) do
      raise Unauthenticated unless ctx[:current_user]
      block.call(inputs, ctx)
    end
  end
end
