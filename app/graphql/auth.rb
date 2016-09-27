module Auth
  class Unauthenticated < StandardError; end

  def self.authenticate_user!(&block)
    -> (obj, args, ctx) do
      raise Unauthenticated unless ctx[:current_user]
      block.call(obj, args, ctx)
    end
  end
end
